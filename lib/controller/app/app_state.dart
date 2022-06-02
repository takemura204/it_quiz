import 'package:flutter/material.dart';

class AppState {
  /// BuildContextの不要なNavigatorへのアクセスを提供する
  GlobalKey<NavigatorState> navigatorKey;
  NavigatorState get navigator {
    final state = navigatorKey.currentState;

    if (state == null) {
      throw Exception("navigatorKey.currentStateがnullです");
    }

    return state;
  }

  GlobalKey<ScaffoldMessengerState> scaffoldManagerKey;
  ScaffoldMessengerState get scaffoldManager {
    final state = scaffoldManagerKey.currentState;

    if (state == null) {
      throw Exception("scaffoldManagerKey.currentStateがnullです");
    }

    return state;
  }

  AppState._({
    required this.navigatorKey,
    required this.scaffoldManagerKey,
  });

  factory AppState() {
    return AppState._(
      navigatorKey: GlobalKey<NavigatorState>(),
      scaffoldManagerKey: GlobalKey<ScaffoldMessengerState>(),
    );
  }
}
