import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  /// Theme.of(context).color への convenience method です
  Color get mainColor => Theme.of(this).primaryColor;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  /// Theme.of(context).textTheme への convenience method です
  TextTheme get texts => Theme.of(this).textTheme;

  /// MediaQuery.of(this).size への convenience method です
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  ///Navigator.of(context).push への convenience method
  Future Function<T extends Object?>(Route<T> route) get showScreen =>
      Navigator.of(this).push;
}
