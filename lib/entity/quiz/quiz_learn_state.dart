import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/entity/quiz/quiz_learn.dart';

part 'quiz_learn_state.freezed.dart';

@freezed
class QuizLearnState with _$QuizLearnState {
  QuizLearnState._();

  factory QuizLearnState({
    QuizLearn? source,
  }) = _Create;

  /// クイズID
  int get id => source!.quizId;

  ///問題文
  String get question => source!.question;

  ///答え
  String get ans => source!.ans;

  ///苦手かどうか
  bool get isWeak => source!.isWeak;
}
