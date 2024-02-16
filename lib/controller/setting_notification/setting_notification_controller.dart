import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_notification/setting_notification_state.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';
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
    final prefs = await SharedPreferences.getInstance();
    final askedBefore = prefs.getBool('askedNotificationPermission') ?? false;
    var permissionStatus = await Permission.notification.status;

    // Android 13 (API level 33) 以降の場合、新しい通知許可プロンプトを使用
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        // Android 13 以降の通知許可チェック
        final bool isNotificationEnabled = await flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.areNotificationsEnabled() ??
            false;
        permissionStatus = isNotificationEnabled
            ? PermissionStatus.granted
            : PermissionStatus.denied;
      }
    }

    // 通知許可を求める (Android 13 以前と iOS の場合)
    if (!askedBefore || permissionStatus.isDenied) {
      permissionStatus = await Permission.notification.request();
      await prefs.setBool('askedNotificationPermission', true);
    }

    state = state.copyWith(isNotification: permissionStatus.isGranted);
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
      {required TimeOfDay selectNotificationTime,
      DateTimeComponents? dateTimeComponents}) async {
    try {
      final notificationTime =
          ref.read(userModelProvider).selectNotificationTime;
      if (notificationTime == null) {
        print('Notification time is not set');
        return;
      }

      // 日時をTimeZoneを考慮した日時に変換する
      final scheduleTime = tz.TZDateTime(
          tz.local,
          dateTime.year,
          dateTime.month,
          dateTime.day,
          selectNotificationTime.hour,
          selectNotificationTime.minute);

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

      final randomIndex = Random().nextInt(9);

      // 通知テキストを取得
      final notificationTitle = I18n().notificationTitle(randomIndex);
      final notificationText = I18n().notificationText(randomIndex);
      await flnp.zonedSchedule(
        1,
        '$notificationTitle',
        '$notificationText',
        scheduleTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      print('scheduleNotifications Error: $e');
    }
  }
}
