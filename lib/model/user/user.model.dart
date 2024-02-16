import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../controller/setting_color/setting_color_controller.dart';
import '../notification_time/notification_time.dart';

final userModelProvider = StateNotifierProvider<UserModel, User>(
  (ref) => UserModel(ref),
);

class UserModel extends StateNotifier<User> with LocatorMixin {
  UserModel(this.ref) : super(const User()) {
    initState();
  }

  final Ref ref;
  final userNameController = TextEditingController();

  @override
  Future initState() async {
    _loadUserData();
    // _resetData();
    super.initState();
  }

  Future _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = prefs.getInt('daily_goal') ?? state.dailyGoal;
    final userName = prefs.getString('user_name') ?? state.userName;
    final themeId = prefs.getInt('theme_id') ?? state.themeId;
    final hour = prefs.getInt('notification_hour');
    final minute = prefs.getInt('notification_minute');
    final notificationTime = (hour != null && minute != null)
        ? NotificationTime(hour: hour, minute: minute)
        : NotificationTime.defaultTime();
    state = state.copyWith(
        userName: userName,
        dailyGoal: dailyGoal,
        themeId: themeId,
        selectNotificationTime: notificationTime);
    userNameController.text = state.userName;
    _saveDevice();
  }

  Future updateUserName(String value) async {
    state = state.copyWith(userName: value);
    _saveDevice();
  }

  void updateDailyGoal(int value) {
    state = state.copyWith(dailyGoal: value);
    _saveDevice();
  }

  Future updateThemeId(int value) async {
    state = state.copyWith(themeId: value);
    _saveDevice();
    ref.read(settingColorProvider.notifier).loadTheme(state.themeId);
  }

  Future updateNotificationTime({required NotificationTime value}) async {
    try {
      state = state.copyWith(selectNotificationTime: value);
      await _saveDevice();
    } on Exception catch (e, s) {
      print({e, s});
    }
  }

  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = state.dailyGoal;
    final themeId = state.themeId;
    final userName = state.userName;
    final notificationTime = state.selectNotificationTime;
    await prefs.setInt('daily_goal', dailyGoal);
    await prefs.setInt('theme_id', themeId);
    await prefs.setString('user_name', userName);
    if (notificationTime != null) {
      await prefs.setInt('notification_hour', notificationTime.hour ?? 0);
      await prefs.setInt('notification_minute', notificationTime.minute ?? 0);
    }
  }
}
