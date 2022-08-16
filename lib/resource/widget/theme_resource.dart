import 'package:flutter/material.dart';

import 'color_resource.dart';

class DefaultTheme {
  static ThemeData getDefaultTheme(Brightness brightness) {
    final colors = DefaultColorScheme(brightness);

    const weight = 0.9;
    final customize = TextTheme(
      headline1: TextStyle(
          fontSize: 96 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: -1.5),
      headline2: TextStyle(
          fontSize: 60 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5),
      headline3: TextStyle(
          fontSize: 48 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0),
      headline4: TextStyle(
          fontSize: 34 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25),
      headline5: TextStyle(
          fontSize: 24 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0),
      headline6: TextStyle(
          fontSize: 20 * weight,
          fontFamily: "NotoSans",
          color: colors.dark87,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15),
      subtitle1: TextStyle(
          fontSize: 16 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15),
      subtitle2: TextStyle(
          fontSize: 14 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1),
      bodyText1: TextStyle(
          fontSize: 16 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5),
      bodyText2: TextStyle(
          fontSize: 14 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25),
      caption: TextStyle(
          fontSize: 12 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4),
      overline: TextStyle(
          fontSize: 10 * weight,
          fontFamily: "NotoSans",
          color: colors.dark54,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5),
    );

    final base = Typography.material2018();

    final original = Typography.material2018(
      black: base.black.merge(customize),
      white: base.white.merge(customize),
      englishLike: base.englishLike.merge(customize),
      dense: base.dense.merge(customize),
      tall: base.tall.merge(customize),
    );

    return ThemeData(
      cardTheme: const CardTheme(
        margin: EdgeInsets.all(12),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colors.dark87,
        unselectedItemColor: colors.dark26,
        backgroundColor: colors.light100,
        selectedLabelStyle: customize.caption?.apply(
          fontWeightDelta: 2,
        ),
        unselectedLabelStyle: customize.caption?.apply(
          fontWeightDelta: 2,
        ),
      ),
      dialogTheme: DialogTheme(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        titleTextStyle: customize.subtitle1?.apply(
          color: colors.dark87,
        ),
        contentTextStyle: customize.bodyText2,
        backgroundColor: colors.alto10,
      ),
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        fillColor: brightness == Brightness.light
            ? colors.main20.withOpacity(0.2)
            : colors.main20.withOpacity(0.1),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        hintStyle: original.black.caption?.apply(
          color: colors.dark26,
        ),
        errorStyle: original.black.caption?.apply(
          color: colors.red50,
        ),
        labelStyle: original.black.headline6?.apply(
          color: colors.dark87,
        ),
        helperMaxLines: 5,
        errorMaxLines: 5,
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.red50,
            width: 2,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.red50,
            width: 1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.main50,
            width: 1,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.alto20,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colors.main50,
            width: 3,
          ),
        ),
      ),
      brightness: brightness,
      typography: original,
      // チェックボックスの枠線
      unselectedWidgetColor: colors.dark54,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.main50,
        selectionColor:
            brightness == Brightness.light ? colors.main20 : colors.main10,
        selectionHandleColor: colors.main50,
      ),
      tooltipTheme: TooltipThemeData(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: colors.main10,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        padding: const EdgeInsets.all(8),
        textStyle: customize.subtitle2?.apply(
          color: colors.onMain10,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: colors.main10.withOpacity(0.98),
        actionTextColor: colors.main50,
        contentTextStyle: customize.subtitle2?.apply(
          color: colors.onMain10,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: colors.dark54,
        size: 24,
      ),
      toggleableActiveColor: colors.main50,
      dividerColor: colors.dark26,
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: colors.main50,
            width: 4,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: colors.dark87,
        unselectedLabelColor: colors.dark54,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: colors.dark87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        color: colors.light100,
        elevation: 0,
        iconTheme: IconThemeData(
          color: colors.dark87,
        ),
        actionsIconTheme: IconThemeData(
          color: colors.dark87,
        ),
      ),
      primaryColor: colors.main50,
      scaffoldBackgroundColor: colors.light100,
      colorScheme: ColorScheme(
        primary: colors.main50,
        secondary: colors.main10,
        surface: colors.light100,
        background: colors.light100,
        error: colors.main50,
        onPrimary: colors.onMain50,
        onSecondary: colors.onMain10,
        onSurface: colors.dark87,
        onBackground: colors.dark87,
        onError: colors.onMain50,
        brightness: brightness,
      ),
    );
  }
}
