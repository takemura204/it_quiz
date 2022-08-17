import 'package:flutter/material.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/screen/quiz_choice_screen/quiz_choice_screen.dart';
import 'package:kentei_quiz/screen/quiz_learn/quiz_learn_screen.dart';
import 'package:kentei_quiz/screen/quiz_result/quiz_result_screen.dart';

import '../resource/controller/screen_argument_resource.dart';

///一問一答形式へ画面遷移
class QuizLearnScreenArguments with _NoParamsMixin implements IScreenArguments {
  const QuizLearnScreenArguments({required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_learn";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizLearnScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizLearnScreen(this)),
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
  const QuizChoiceScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_choice";

  @override
  Route generateRoute() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            QuizChoiceScreen(this),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(builder: (context) => QuizChoiceScreen(this)),
              context,
              animation,
              secondaryAnimation,
              child);
        },
      );
}

///クイズ結果画面
class QuizResultScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizResultScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_result";

  @override
  Route generateRoute() => MaterialPageRoute(
        builder: (_) => QuizResultScreen(this),
      );
}

mixin _NoParamsMixin<T> implements IScreenArguments<T> {
  @override
  String get screenName => screenNameFormat;
}

mixin _QuizIdParamsMixin<T> implements IScreenArguments<T> {
  int? get quizId;

  String get programIdKey => ":program_id";

  @override
  String get screenName =>
      screenNameFormat.replaceAll(RegExp(programIdKey), quizId.toString());
}
