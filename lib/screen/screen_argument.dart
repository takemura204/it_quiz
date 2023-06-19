import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/screen/account_login_screen/account_login_screen.dart';
import 'package:kentei_quiz/screen/account_profile_screen/account_profile_screen.dart';
import 'package:kentei_quiz/screen/quiz_choice_screen/quiz_choice_screen.dart';
import 'package:kentei_quiz/screen/quiz_learn_screen/quiz_learn_screen.dart';
import 'package:kentei_quiz/screen/quiz_true_false_screen/quiz_true_false_screen.dart';
import 'package:kentei_quiz/screen/setting_color_screen/setting_color_screen.dart';

import '../resource/screen_argument_resource.dart';
import 'account_create_screen/account_create_screen1.dart';
import 'account_create_screen/account_create_screen2.dart';
import 'account_update_screen/account_update_screen.dart';

///一問一答形式へ画面遷移
class QuizLearnScreenArguments with _NoParamsMixin implements IScreenArguments {
  const QuizLearnScreenArguments({required this.item});

  final QuizItemState item;

  @override
  String get screenNameFormat => "/quiz_learn";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizLearnScreen(item),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizLearnScreen(item)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///4択形式へ画面遷移
class QuizChoiceScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizChoiceScreenArguments({required this.item});

  final QuizItemState item;

  @override
  String get screenNameFormat => "/quiz_choice";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizChoiceScreen(item),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizChoiceScreen(item)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///○×クイズ
class QuizTrueFalseScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizTrueFalseScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItemState item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_true_false";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizTureFalseScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => QuizTureFalseScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///カラーテーマ画面
class SettingColorScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const SettingColorScreenArguments();

  @override
  String get screenNameFormat => "/setting_color";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SettingColorScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => const SettingColorScreen()),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///プロフィール画面
class ProfileScreenArguments with _NoParamsMixin implements IScreenArguments {
  const ProfileScreenArguments();

  @override
  String get screenNameFormat => "/profile";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AccountProfileScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => AccountProfileScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///ログイン画面
class AccountLoginScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const AccountLoginScreenArguments();

  @override
  String get screenNameFormat => "/login";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AccountLoginScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => AccountLoginScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///新規登録1
class AccountCreateStep1ScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const AccountCreateStep1ScreenArguments();

  @override
  String get screenNameFormat => "/create_account1";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AccountCreateStep1Screen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                  builder: (context) => AccountCreateStep1Screen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///新規登録2
class AccountCreateStep2ScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const AccountCreateStep2ScreenArguments();

  @override
  String get screenNameFormat => "/create_account2";

  @override
  Route generateRoute() => CupertinoPageRoute(
        builder: (context) => AccountCreateStep2Screen(this),
      );
}

///パスワード再設定
class AccountUpdateScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const AccountUpdateScreenArguments();

  @override
  String get screenNameFormat => "/update_account";

  @override
  Route generateRoute() => CupertinoPageRoute(
        builder: (context) => AccountUpdateScreen(this),
      );
}

mixin _NoParamsMixin<T> implements IScreenArguments<T> {
  @override
  String get screenName => screenNameFormat;
}
