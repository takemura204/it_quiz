import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_notification/setting_notification_state.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:timezone/timezone.dart' as tz;

final settingNotificationProvider = StateNotifierProvider<
    SettingNotificationController,
    SettingNotificationState>((ref) => SettingNotificationController(ref: ref));

class SettingNotificationController
    extends StateNotifier<SettingNotificationState>
    with LocatorMixin {
  SettingNotificationController({required this.ref})
      : super(const SettingNotificationState()) {
        () {
      _initialize();
    }();
  }

  final Ref ref;

  Future _initialize() async {
    await checkNotificationPermission();
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  Future<bool> checkNotificationPermission() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    final bool didNotificationLaunchApp =
        notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;
    state = state.copyWith(isNotification: didNotificationLaunchApp);
    return didNotificationLaunchApp;
  }


  Future<void> requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }
  }

  Future<void> _scheduleDaily8AMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'OB-1',
      '本日の顔を撮影をしましょう',
      _nextInstanceOf8AM(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'ob-1-face-daily',
          'ob-1-face-daily',
          channelDescription: 'Face photo notification',
        ),
        iOS: DarwinNotificationDetails(
          badgeNumber: 1,
        ),
      ),
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  // 1回目に通知を飛ばす時間の作成
  tz.TZDateTime _nextInstanceOf8AM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, 8);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
