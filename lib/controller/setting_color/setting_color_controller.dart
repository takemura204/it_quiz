import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/setting_color/setting_color_state.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final settingColorProvider =
    StateNotifierProvider<SettingColorController, SettingColorState>(
        (ref) => SettingColorController(ref: ref));

class SettingColorController extends StateNotifier<SettingColorState>
    with LocatorMixin {
  SettingColorController({required this.ref})
      : super(const SettingColorState()) {
    () {
      initState();
    }();
  }
  final Ref ref;
  final colors = [
    AppColor.main,
    AppColor.red1,
    AppColor.red2,
    AppColor.yellow1,
    AppColor.yellow2,
    AppColor.green1,
    AppColor.green2,
    AppColor.green3,
    AppColor.blue1,
    AppColor.blue2,
    AppColor.purple1,
    AppColor.purple2,
    AppColor.pink1,
    AppColor.brown1,
    AppColor.brown2,
    AppColor.black1,
  ];

  @override
  Future initState() async {
    await initTheme();
    super.initState();
  }

  ///初期テーマ設定
  Future initTheme() async {
    final themeId = await getThemeId();
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
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
        titleTextStyle: TextStyle(
          color: getThemePrimaryColor(themeId),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: Border(
            bottom: BorderSide(color: getThemePrimaryColor(themeId), width: 3)),
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

    final mainColor = getThemePrimaryColor(themeId);

    state = state.copyWith(isLoading: true);
    state = state.copyWith(
        themeId: themeId, themeData: themeData, mainColor: mainColor);
    state = state.copyWith(isLoading: false);
  }

  Future setTheme(int themeId) async {
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
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
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
          titleTextStyle: TextStyle(
            color: getThemePrimaryColor(themeId),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          shape: Border(
              bottom:
                  BorderSide(color: getThemePrimaryColor(themeId), width: 3)),
          color: Colors.white,
          elevation: 2,
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
      final mainColor = getThemePrimaryColor(themeId);

      state = state.copyWith(isLoading: true);
      state = state.copyWith(
          themeId: themeId, themeData: themeData, mainColor: mainColor);
      state = state.copyWith(isLoading: false);
      // ignore: empty_catches
    } on Exception catch (e) {
      print("エラー:${e}");
    }
  }

  MaterialColor getThemePrimaryColor(int themeId) {
    switch (themeId) {
      case 0:
        return AppColor.main;
      case 1:
        return AppColor.red1;
      case 2:
        return AppColor.red2;
      case 3:
        return AppColor.yellow1;
      case 4:
        return AppColor.yellow2;
      case 5:
        return AppColor.green1;
      case 6:
        return AppColor.green2;
      case 7:
        return AppColor.green3;
      case 8:
        return AppColor.blue1;
      case 9:
        return AppColor.blue2;
      case 10:
        return AppColor.purple1;
      case 11:
        return AppColor.purple2;
      case 12:
        return AppColor.pink1;
      case 13:
        return AppColor.brown1;
      case 14:
        return AppColor.brown2;
      case 15:
        return AppColor.black1;
      default:
        return AppColor.main;
    }
  }

  String colorName(int themeId) {
    switch (themeId) {
      case 0:
        return "default";
      case 1:
        return "red1";
      case 2:
        return "red2";
      case 3:
        return "yellow1";
      case 4:
        return "yellow2";
      case 5:
        return "green1";
      case 6:
        return "green2";
      case 7:
        return "green3";
      case 8:
        return "blue1";
      case 9:
        return "blue2";
      case 10:
        return "purple1";
      case 11:
        return "purple2";
      case 12:
        return "pink1";
      case 13:
        return "brown1";
      case 14:
        return "brown2";
      case 15:
        return "black1";
      default:
        return '';
    }
  }

  Future getThemeId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('themeId') ?? 0;
  }

  Future setThemeId(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeId', value);
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
        fontSize: 16,
        fontFamily: "NotoSans",
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15),
    titleSmall: TextStyle(
        fontSize: 14,
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