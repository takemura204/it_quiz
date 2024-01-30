import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_color/setting_color_state.dart';
import 'package:kentei_quiz/resource/color_resource.dart';

final settingColorProvider =
    StateNotifierProvider<SettingColorController, SettingColorState>(
        (ref) => SettingColorController(ref: ref));

class SettingColorController extends StateNotifier<SettingColorState> {
  SettingColorController({required this.ref})
      : super(const SettingColorState()) {
    () {
      initState();
    }();
  }

  final Ref ref;
  final colors = [
    AppColor.main,
    AppColor.peach,
    AppColor.red,
    AppColor.mint,
    AppColor.green,
    AppColor.cyan,
    AppColor.blue,
    AppColor.purple,
    AppColor.brown,
    AppColor.black,
  ];

  Future initState() async {}

  @override
  Future dispose() async {
    super.dispose();
  }

  ///カラーテーマ設定
  ThemeData loadTheme(int themeId) {
    try {
      final themeData = ThemeData(
        ///Card
        cardTheme: const CardTheme(
          margin: EdgeInsets.all(0),
        ),

        ///BottomNavigationBar
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black26,
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: "NotoSans",
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: "NotoSans",
          ),
          elevation: 1,
        ),

        /// Dialog
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Colors.white,
        ),

        /// TextField
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          alignLabelWithHint: true,
          fillColor: const Color(0xffF8FAFA),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          hintStyle: original.black.bodySmall?.apply(
            color: Colors.black26,
          ),
          errorStyle: original.black.bodySmall?.apply(
            color: Colors.red,
          ),
          labelStyle: original.black.titleLarge?.apply(
            color: Colors.black87,
          ),
          helperMaxLines: 5,
          errorMaxLines: 5,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: getThemePrimaryColor(themeId),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: getThemePrimaryColor(themeId),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: getThemePrimaryColor(themeId),
            ),
          ),
        ),

        ///明るさ
        brightness: Brightness.light,

        ///フォント
        typography: original,

        /// チェックボックスの枠線
        unselectedWidgetColor: Colors.black54,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: getThemePrimaryColor(themeId),
          selectionColor: getThemePrimaryColor(themeId).shade50,
          selectionHandleColor: getThemePrimaryColor(themeId),
        ),

        /// Tooltip
        tooltipTheme: TooltipThemeData(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: getThemePrimaryColor(themeId).shade50,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(8),
        ),

        /// SnackBar
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.fixed,
          backgroundColor: getThemePrimaryColor(themeId).shade50,
          actionTextColor: getThemePrimaryColor(themeId).shade50,
          contentTextStyle: TextStyle(
              color: getThemePrimaryColor(themeId).shade50,
              fontWeight: FontWeight.bold),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
        ),

        ///Icon
        iconTheme: const IconThemeData(
          color: Colors.black54,
          size: 24,
        ),

        ///Divider
        dividerColor: Colors.black54,

        /// TabBar
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: getThemePrimaryColor(themeId),
              width: 4,
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.black54,
        ),

        ///AppBar
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSans",
          ),
          shape: Border(
              bottom:
                  BorderSide(color: getThemePrimaryColor(themeId), width: 1.5)),
          color: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black87,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.black87,
          ),
        ),

        ///PrimaryColor
        primaryColor: getThemePrimaryColor(themeId),

        ///Scaffold
        scaffoldBackgroundColor: getThemePrimaryColor(themeId).shade50,

        ///context.colors
        colorScheme: ColorScheme(
          primary: getThemePrimaryColor(themeId),
          secondary: getThemePrimaryColor(themeId).shade50,
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black87,
          onBackground: Colors.black87,
          onError: Colors.white,
          brightness: Brightness.light,
        ),

        ///CheckboxButton
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return getThemePrimaryColor(themeId);
            }
            return null;
          }),
        ),

        /// RadioButton
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return getThemePrimaryColor(themeId);
            }
            return null;
          }),
        ),

        ///SwietchButton
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return getThemePrimaryColor(themeId);
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return getThemePrimaryColor(themeId);
            }
            return null;
          }),
        ),
      );
      return themeData;
    } on Exception catch (e, s) {
      print("Error:$e,$s");
      rethrow;
    }
  }

  MaterialColor getThemePrimaryColor(int themeId) {
    switch (themeId) {
      case 0:
        return AppColor.main;
      case 1:
        return AppColor.peach;
      case 2:
        return AppColor.red;
      case 3:
        return AppColor.mint;
      case 4:
        return AppColor.green;
      case 5:
        return AppColor.cyan;
      case 6:
        return AppColor.blue;
      case 7:
        return AppColor.purple;
      case 8:
        return AppColor.brown;
      case 9:
        return AppColor.black;
      default:
        return AppColor.main;
    }
  }

  String colorName(int themeId) {
    switch (themeId) {
      case 0:
        return "マスタード";
      case 1:
        return "ピーチ";
      case 2:
        return "フラミンゴ";
      case 3:
        return "ミント";
      case 4:
        return "フォレスト";
      case 5:
        return "スカイ";
      case 6:
        return "インディゴ";
      case 7:
        return "ラベンダー";
      case 8:
        return "チョコ";
      case 9:
        return "モノトーン";
      default:
        return 'デフォルト';
    }
  }

  static TextTheme customize = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 96,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.5),
    displayMedium: TextStyle(
        fontSize: 60,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5),
    displaySmall: TextStyle(
        fontSize: 48,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0),
    headlineMedium: TextStyle(
        fontSize: 34,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25),
    headlineSmall: TextStyle(
        fontSize: 24,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0),
    titleLarge: TextStyle(
        fontSize: 20,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15),
    titleMedium: TextStyle(
        fontSize: 18,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15),
    titleSmall: TextStyle(
        fontSize: 16,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    labelSmall: TextStyle(
        fontSize: 10,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );

  final original = Typography.material2018(
    black: Typography.material2018().black.merge(customize),
    white: Typography.material2018().white.merge(customize),
    englishLike: Typography.material2018().englishLike.merge(customize),
    dense: Typography.material2018().dense.merge(customize),
    tall: Typography.material2018().tall.merge(customize),
  );
}
