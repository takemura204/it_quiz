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
    state = state.copyWith(dailyGoal: dailyGoal, themeId: themeId);
    _saveDevice();
    print({'_loadUserData', state.themeId});
  }

  void updateDailyGoal(int value) {
    state = state.copyWith(dailyGoal: value);
    _saveDevice();
  }

  Future updateThemeId(int value) async {
    state = state.copyWith(themeId: value);
    _saveDevice();
    ref.read(settingColorProvider.notifier).loadTheme(state.themeId);
    print(state.themeId);
  }

  Future updateNotificationTime({required NotificationTime value}) async {
    try {
      state = state.copyWith(selectNotificationTime: value);
    } on Exception catch (e, s) {
      print({e, s});
    }
  }

  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyGoal = state.dailyGoal;
    final themeId = state.themeId;
    await prefs.setInt('daily_goal', dailyGoal);
    await prefs.setInt('theme_id', themeId);
  }
}
