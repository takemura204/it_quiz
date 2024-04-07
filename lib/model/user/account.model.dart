import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../controller/setting_color/setting_color_controller.dart';
import '../notification_time/notification_time.dart';
import 'account.dart';

final accountModelProvider = StateNotifierProvider<AccountModel, Account>(
  (ref) => AccountModel(ref),
);

class AccountModel extends StateNotifier<Account> with LocatorMixin {
  AccountModel(this.ref) : super(const Account()) {
    initState();
  }

  final Ref ref;
  final userNameController = TextEditingController();

  @override
  Future initState() async {
    _createUserData().then((x) {
      _loadUserData();
    });
    // _resetData();
    super.initState();
  }

  Future _createUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final prefs = await SharedPreferences.getInstance();
      final uid = prefs.getString('uid');
      if (uid == null) {
        final userCredential = await auth.signInAnonymously();
        final user = userCredential.user;
        if (user != null) {
          final uid = user.uid; // 新しいUIDを取得
          state = state.copyWith(uid: uid);
          await _saveDevice(); // デバイスにUIDを保存
        }
      }
    } catch (e) {
      print("Firebase Auth Error: $e");
    }
  }

  Future _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid') ?? state.uid;
    final userName = prefs.getString('user_name') ?? state.userName;
    final dailyGoal = prefs.getInt('daily_goal') ?? state.dailyGoal;
    final themeId = prefs.getInt('theme_id') ?? state.themeId;
    final hour = prefs.getInt('notification_hour');
    final minute = prefs.getInt('notification_minute');
    final isPremium = prefs.getBool('is_Premium') ?? state.isPremium;
    final notificationTime = (hour != null && minute != null)
        ? NotificationTime(hour: hour, minute: minute)
        : NotificationTime.defaultTime();
    state = state.copyWith(
      uid: uid,
      userName: userName,
      dailyGoal: dailyGoal,
      themeId: themeId,
      selectNotificationTime: notificationTime,
      isPremium: isPremium,
    );
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

  void updateIsPremium(bool value) {
    state = state.copyWith(isPremium: value);
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
    final uid = state.uid;
    final userName = state.userName;
    final dailyGoal = state.dailyGoal;
    final themeId = state.themeId;
    final isPremium = state.isPremium;
    final notificationTime = state.selectNotificationTime;
    await prefs.setString('uid', uid);
    await prefs.setString('user_name', userName);
    await prefs.setInt('daily_goal', dailyGoal);
    await prefs.setInt('theme_id', themeId);

    if (notificationTime != null) {
      await prefs.setInt('notification_hour', notificationTime.hour ?? 0);
      await prefs.setInt('notification_minute', notificationTime.minute ?? 0);
    }
    await prefs.setBool('is_Premium', isPremium);
  }
}
