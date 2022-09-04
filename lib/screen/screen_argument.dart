import 'package:flutter/material.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/screen/quiz_choice_screen/quiz_choice_screen.dart';
import 'package:kentei_quiz/screen/quiz_learn_screen/quiz_learn_screen.dart';
import 'package:kentei_quiz/screen/quiz_true_false_screen/quiz_true_false_screen.dart';

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

///○×クイズ
class QuizTrueFalseScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizTrueFalseScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
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
