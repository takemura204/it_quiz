import 'package:flutter/material.dart';
import 'package:kentei_quiz/entity/quiz_item/quiz_item.dart';
import 'package:kentei_quiz/screen/quiz_one_question/quiz_one_question_screen.dart';

import '../resource/screen_argument_resource.dart';

///一問一答形式の画面
class QuizOneQuestionScreenArguments
    with _NoParamsMixin
    implements IScreenArguments {
  const QuizOneQuestionScreenArguments(
      {required this.item, required this.quizStyle});

  final QuizItem item;
  final String quizStyle;

  @override
  String get screenNameFormat => "/quiz_one_question";

  @override
  Route generateRoute() => MaterialPageRoute(
        builder: (_) => QuizOneQuestionScreen(this),
        settings: settings,
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
