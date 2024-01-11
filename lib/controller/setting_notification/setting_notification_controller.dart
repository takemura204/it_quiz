import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_notification/setting_notification_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

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

  Future _initState() async {
    await checkNotificationPermission();
    _notificationPermissionStream();
  }

  @override
  Future dispose() async {
    _permissionStreamSubscription?.cancel();
    super.dispose();
  }

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
        Stream.periodic(const Duration(milliseconds: 1500))
            .asyncMap((_) => Permission.notification.status)
            .distinct()
            .listen((status) {
      state = state.copyWith(isNotification: status.isGranted);
    });
  }
}
