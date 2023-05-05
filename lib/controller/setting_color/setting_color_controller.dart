import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_color/setting_color_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../resource/color_resource.dart';

final settingColorProvider =
    StateNotifierProvider((ref) => SettingColorController(ref));

class SettingColorController extends StateNotifier<SettingColorState>
    with LocatorMixin {
  SettingColorController(this.ref) : super(SettingColorState()) {
    () async {
      await initState();
    }();
  }
  final Ref ref;

  @override
  Future initState() async {
    await initTheme();
    super.initState();
  }

  Future initTheme() async {
    final themeId = await getThemeId();

    final themeData = ThemeData(
      fontFamily: 'NoteSansJP',
      canvasColor: Colors.transparent,
      primaryColor: await getThemePrimaryColor(themeId),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: await getThemePrimaryColor(themeId),
      ),
    );

    final mainColor = await getThemePrimaryColor(themeId);

    state = state.copyWith(isLoading: true);
    state = state.copyWith(
        themeId: themeId, themeData: themeData, mainColor: mainColor);
    state = state.copyWith(isLoading: false);
  }

  Future<void> setTheme(int themeId) async {
    try {
      final themeData = ThemeData(
        fontFamily: 'NoteSansJP',
        backgroundColor: const Color(0xFFF8FAFA),
        accentColor: await getThemePrimaryColor(themeId),
        canvasColor: Colors.transparent,
        primaryColor: await getThemePrimaryColor(themeId),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: await getThemePrimaryColor(themeId),
        ),
      );
      final mainColor = await getThemePrimaryColor(themeId);

      state = state.copyWith(isLoading: true);
      state = state.copyWith(
          themeId: themeId, themeData: themeData, mainColor: mainColor);
      state = state.copyWith(isLoading: false);
      // ignore: empty_catches
    } on Exception catch (e, s) {}
  }

  Future getThemePrimaryColor(int themeId) async {
    switch (themeId) {
      case 0:
        return AppColor.skin0;
      case 1:
        return AppColor.skin1;
      case 2:
        return AppColor.skin2;
      case 3:
        return AppColor.skin3;
      case 4:
        return AppColor.skin4;
      case 5:
        return AppColor.skin5;
      case 6:
        return AppColor.skin6;
      case 7:
        return AppColor.skin7;
      default:
        return AppColor.skin0;
    }
  }

  Future getThemeId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('themeId') ?? 1;
  } //初期スキンをノースポールに変更

  Future setThemeId(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeId', value);
  }
}
