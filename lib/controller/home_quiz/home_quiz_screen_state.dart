import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz/quiz.dart';

part 'home_quiz_screen_state.freezed.dart';

@freezed
class HomeQuizScreenState with _$HomeQuizScreenState {
  const factory HomeQuizScreenState({
    @Default(false) bool isLoading,
    @Default([]) final List<Quiz> filterQuizList,
    @Default([]) final List<String> categoryList,
    @Default([]) final List<double> correctRatios,
    @Default([]) final List<String> selectedTestCategory,
    @Default("") final String selectCategory,
    @Default(0) final int itemIndex, //クイズ番号
    @Default(0) final int tabIndex, //クイズ番号
    @Default(false) bool isSelected,
    @Default([]) final List<String> selectedFilterGroup,
    @Default(10) final int selectedStudyLength,
    @Default(10) final int selectedTestLength,
    @Default(10) final int selectedWeakLength,
    Quiz? selectQuiz,
    Quiz? selectStudyQuiz, //
    Quiz? selectWeakQuiz, //苦手克服
  }) = _HomeQuizScreenState;
}
