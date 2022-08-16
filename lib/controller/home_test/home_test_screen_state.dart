import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entity/quiz/quiz_learn.dart';
import '../../entity/quiz/quiz_learn_state.dart';

part 'home_test_screen_state.freezed.dart';

@freezed
class HomeTestScreenState with _$HomeTestScreenState {
  HomeTestScreenState._();
  factory HomeTestScreenState({
    @Default([]) List<String> tabNames,
    final QuizLearn? source,
  }) = _Create;

  QuizLearn get _source {
    final s = source;
    if (s != null) {
      return s;
    }
    throw Exception("error: no source $runtimeType");
  }

  late final QuizLearnState quizLearn = QuizLearnState(source: _source);
}
