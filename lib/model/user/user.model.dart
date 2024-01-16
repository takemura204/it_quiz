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

  @override
  Future initState() async {
    _loadUserData();
    // _resetData();
    super.initState();
  }

  Future _loadUserData() async {
    print('_loadUserData');
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = prefs.getInt('daily_goal') ?? state.dailyGoal;
    final themeId = prefs.getInt('theme_id') ?? state.themeId;
    final hour = prefs.getInt('notification_hour');
    final minute = prefs.getInt('notification_minute');
    final notificationTime = (hour != null && minute != null)
        ? NotificationTime(hour: hour, minute: minute)
        : NotificationTime.defaultTime();
    state = state.copyWith(
        dailyGoal: dailyGoal,
        themeId: themeId,
        selectNotificationTime: notificationTime);
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
    final notificationTime = state.selectNotificationTime;
    await prefs.setInt('daily_goal', dailyGoal);
    await prefs.setInt('theme_id', themeId);
    if (notificationTime != null) {
      await prefs.setInt('notification_hour', notificationTime.hour ?? 0);
      await prefs.setInt('notification_minute', notificationTime.minute ?? 0);
    }
  }
}
