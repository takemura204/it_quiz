import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_notification/setting_notification_state.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../model/notification_time/notification_time.dart';

final settingNotificationProvider = StateNotifierProvider<
    SettingNotificationController,
    SettingNotificationState>((ref) => SettingNotificationController(ref: ref));

class SettingNotificationController
    extends StateNotifier<SettingNotificationState> with LocatorMixin {
  SettingNotificationController({required this.ref})
      : super(const SettingNotificationState()) {
    () {}();
  }

  final Ref ref;
  StreamSubscription? _permissionStreamSubscription;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future initState() async {
    _notificationPermissionStream();
    await _initTimeZone();
    await _initLocalNotifications();
    await checkNotificationPermission();
    final selectNotificationTime =
        ref.read(authModelProvider).selectNotificationTime;
    scheduleNotifications(
        value: selectNotificationTime ?? NotificationTime.defaultTime());
  }

  @override
  Future dispose() async {
    _permissionStreamSubscription?.cancel();
    super.dispose();
  }

  /// flutter_local_notificationsの初期化
  Future _initLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon_foreground'); // アプリのアイコンを設定

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
      final androidInfo = await DeviceInfoPlugin().androidInfo;
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

  Future<void> scheduleNotifications({required NotificationTime value}) async {
    try {
      final dateTime = DateTime.now();
      final notificationTime =
          ref.read(authModelProvider).selectNotificationTime;
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
        value.hour ?? 8,
        value.minute ?? 30,
      );

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

      final randomIndex = Random().nextInt(10);

      // 通知テキストを取得
      final notificationTitle = I18n().notificationTitle(randomIndex);
      final notificationText = createNotificationText();
      print(notificationText);
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

  String createNotificationText() {
    final weakQuizItemList =
        ref.read(quizModelProvider).weakQuiz?.quizItemList ?? [];
    final historyQuizItemList =
        ref.read(quizModelProvider).historyQuizList.first.quizItemList;
    final random = Random();

    if (weakQuizItemList.isNotEmpty) {
      final randomIndex = random.nextInt(weakQuizItemList.length);
      return '「${weakQuizItemList[randomIndex].word}」について復習してみましょう！\nクイズの「苦手克服」から挑戦できます';
    } else if (historyQuizItemList.isNotEmpty) {
      final randomIndex = random.nextInt(historyQuizItemList.length);
      return '「${historyQuizItemList[randomIndex].ans}」とはどのような意味だったでしょう？\n履歴から確認してみましょう！';
    } else {
      return '「経営理念」について学んでみましょう！';
    }
  }
}
