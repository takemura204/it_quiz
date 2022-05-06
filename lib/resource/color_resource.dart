import 'package:flutter/material.dart';

extension ColorSchemeEx on ColorScheme {
  Color get alto10 => DefaultColorScheme(brightness).alto10;
  Color get alto20 => DefaultColorScheme(brightness).alto20;
  Color get main50 => DefaultColorScheme(brightness).main50;
  Color get main20 => DefaultColorScheme(brightness).main20;
  Color get main10 => DefaultColorScheme(brightness).main10;
  Color get dark12 => DefaultColorScheme(brightness).dark12;
  Color get dark26 => DefaultColorScheme(brightness).dark26;
  Color get dark54 => DefaultColorScheme(brightness).dark54;
  Color get dark87 => DefaultColorScheme(brightness).dark87;
  Color get light12 => DefaultColorScheme(brightness).light12;
  Color get light30 => DefaultColorScheme(brightness).light30;
  Color get light70 => DefaultColorScheme(brightness).light70;
  Color get light100 => DefaultColorScheme(brightness).light100;
  Color get twitter => DefaultColorScheme(brightness).twitter;
  Color get instagram => DefaultColorScheme(brightness).instagram;
  Color get youtube => DefaultColorScheme(brightness).youtube;
  Color get line => DefaultColorScheme(brightness).line;
  Color get facebook => DefaultColorScheme(brightness).facebook;
  Color get onMain50 => DefaultColorScheme(brightness).onMain50;
  Color get onMain10 => DefaultColorScheme(brightness).onMain10;
  Color get red50 => DefaultColorScheme(brightness).red50;
  Color get orange50 => DefaultColorScheme(brightness).orange50;
  Color get orange100 => DefaultColorScheme(brightness).orange100;
  Color get orange200 => DefaultColorScheme(brightness).orange200;
}

class DefaultColorScheme {
  final Color alto10;
  final Color alto20;
  final Color main50;
  final Color main20;
  final Color main10;
  final Color red50;
  final Color dark12;
  final Color dark26;
  final Color dark54;
  final Color dark87;
  final Color light12;
  final Color light30;
  final Color light70;
  final Color light100;
  final Color twitter;
  final Color instagram;
  final Color youtube;
  final Color line;
  final Color facebook;
  final Color orange50;
  final Color orange100;
  final Color orange200;

  Color get onMain50 => _light100;
  Color get onMain10 => dark54;

  const DefaultColorScheme._({
    required this.alto10,
    required this.alto20,
    required this.main50,
    required this.main20,
    required this.main10,
    required this.red50,
    required this.dark12,
    required this.dark26,
    required this.dark54,
    required this.dark87,
    required this.light12,
    required this.light30,
    required this.light70,
    required this.light100,
    required this.orange50,
    required this.orange100,
    required this.orange200,
    this.twitter = const Color(0xff1da1f3),
    this.instagram = const Color(0xffD93177),
    this.youtube = const Color(0xfffe0400),
    this.line = const Color(0xff06C755),
    this.facebook = const Color(0xff1877f2),
  });

  static DefaultColorScheme? _dark;
  static DefaultColorScheme? _light;

  factory DefaultColorScheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return _dark ??= const DefaultColorScheme.dark();
      case Brightness.light:
      default:
        return _light ??= const DefaultColorScheme.light();
    }
  }

  const DefaultColorScheme.dark()
      : this._(
          alto10: _alto10Dark,
          alto20: _alto20Dark,
          main10: _main10Dark,
          main20: _main20Dark,
          main50: _main50,
          red50: _red50,
          dark12: _light12,
          dark26: _light30,
          dark54: _light70,
          dark87: _light100,
          light12: _dark12,
          light30: _dark26,
          light70: _dark54,
          light100: _dark87,
          orange50: _orange50,
          orange100: _orange100,
          orange200: _orange200,
        );

  const DefaultColorScheme.light()
      : this._(
          alto10: _alto10,
          alto20: _alto20,
          main10: _main10,
          main20: _main20,
          main50: _main50,
          red50: _red50,
          dark12: _dark12,
          dark26: _dark26,
          dark54: _dark54,
          dark87: _dark87,
          light12: _light12,
          light30: _light30,
          light70: _light70,
          light100: _light100,
          orange50: _orange50,
          orange100: _orange100,
          orange200: _orange200,
        );

  static const Color _main50 = Color(0xffcd001a);
  static const Color _main20 = Color(0xffF5CCD1);
  static const Color _main20Dark = Color(0xff900012);
  static const Color _main10 = Color(0xfffceff1);
  static const Color _main10Dark = Color(0xff280009);

  static const Color _alto20 = Color(0xfff2f2f2);
  static const Color _alto20Dark = Color(0xff4a3d3e);
  static const Color _alto10 = Color(0xfffcfcfc);
  static const Color _alto10Dark = Color(0xff2b2526);

  static const Color _red50 = Color(0xffff6150);
  static const Color _light100 = Color(0xffffffff);
  static const Color _light70 = Color(0xb3ffffff);
  static const Color _light30 = Color(0x3dffffff);
  static const Color _light12 = Color(0x1effffff);
  static const Color _dark12 = Color(0x1e000000);
  static const Color _dark26 = Color(0x42000000);
  static const Color _dark54 = Color(0x8a000000);
  static const Color _dark87 = Color(0xdf000000);

  static const Color _orange50 = Color(0xFFFFF0B2);
  static const Color _orange100 = Color(0xFFFFE0B2);
  static const Color _orange200 = Color(0xFFFFCC80);
}
