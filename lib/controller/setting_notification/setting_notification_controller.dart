import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_notification/setting_notification_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final settingNotificationProvider = StateNotifierProvider<
    SettingNotificationController,
    SettingNotificationState>((ref) => SettingNotificationController(ref: ref));

class SettingNotificationController
    extends StateNotifier<SettingNotificationState> with LocatorMixin {
  SettingNotificationController({required this.ref})
      : super(const SettingNotificationState()) {
    () {
      _initState();
    }();
  }

  final Ref ref;
  StreamSubscription? _permissionStreamSubscription;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future _initState() async {
    _notificationPermissionStream();

    await _initTimeZone();
    await _initLocalNotifications();
    await checkNotificationPermission();
  }

  @override
  Future dispose() async {
    _permissionStreamSubscription?.cancel();
    super.dispose();
  }

  /// flutter_local_notificationsの初期化
  Future _initLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon_notification'); // アプリのアイコンを設定

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future _initTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  ///通知の通知状況確認
  Future checkNotificationPermission() async {
    //既に許可を求めているか確認
    final prefs = await SharedPreferences.getInstance();
    final askedBefore = prefs.getBool('askedNotificationPermission') ?? false;
    if (!askedBefore) {
      var permissionStatus = await Permission.notification.status;
      permissionStatus = await Permission.notification.request();
      state = state.copyWith(isNotification: permissionStatus.isGranted);
      await prefs.setBool('askedNotificationPermission', true);
    } else {
      var permissionStatus = await Permission.notification.status;
      permissionStatus = await Permission.notification.request();
      state = state.copyWith(isNotification: permissionStatus.isGranted);
      print(permissionStatus);
      await prefs.setBool('askedNotificationPermission', true);
    }
  }

  void _notificationPermissionStream() {
    _permissionStreamSubscription =
        Stream.periodic(const Duration(milliseconds: 1000))
            .asyncMap((_) => Permission.notification.status)
            .distinct()
            .listen((status) {
      state = state.copyWith(isNotification: status.isGranted);
    });
  }

  Future<void> scheduleNotifications(DateTime dateTime,
      {DateTimeComponents? dateTimeComponents}) async {
    try {
      await _cancelNotification();
      print('scheduleNotifications Start');
      // 日時をTimeZoneを考慮した日時に変換する
      final scheduleTime = tz.TZDateTime.from(dateTime, tz.local);
      print(scheduleTime);

      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          'scheduleNotifications_id', // チャンネルID
          'scheduleNotifications_name', // チャンネル名
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'plainCategory'),
      );

      // 通知をスケジュールする
      final flnp = FlutterLocalNotificationsPlugin();
      await flnp
          .zonedSchedule(
        1,
        'スケジュール通知',
        'あなたがスケジュールした時間になりました',
        scheduleTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      )
          .then((value) {
        print('scheduleNotifications Finish');
      });
    } catch (e) {
      print('scheduleNotifications Error: $e');
    }
  }

  ///手動通知
  Future<void> sendNotificationNow() async {
    try {
      print('sendNotificationNow');
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          'sendNotificationNow_id', // チャンネルID
          'sendNotificationNow_name', // チャンネル名
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(categoryIdentifier: 'plainCategory'),
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        '手動通知',
        'あなたがボタンをタップしました',
        platformChannelSpecifics,
      );
    } catch (e) {
      print('sendNotificationNow Error: $e');
    }
  }

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
