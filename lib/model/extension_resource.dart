import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  /// Theme.of(context).color への convenience method です
  Color get mainColor => Theme.of(this).primaryColor;

  Color get defaultColor => const Color(0xFF75C4BF);

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get secondColor => Colors.grey.shade300;

  Color get titleColor => Colors.black54;

  Color get textColor => Colors.black87;

  Color get accentColor => const Color(0xFFF87951);

  Color get correctColor => const Color(0xFF44B571);

  Color get incorrectColor => const Color(0xFFFF7777);

  /// Theme.of(context).textTheme への convenience method です
  TextTheme get texts => Theme.of(this).textTheme;

  /// MediaQuery.of(this).size への convenience method です
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  ///Navigator.of(context).push への convenience method
  Future Function<T extends Object?>(Route<T> route) get showScreen =>
      Navigator.of(this).push;
}
