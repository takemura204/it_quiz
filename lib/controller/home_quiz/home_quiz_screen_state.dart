import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/untils/enums.dart';

import '../../model/quiz/quiz.dart';

part 'home_quiz_screen_state.freezed.dart';

@freezed
class HomeQuizScreenState with _$HomeQuizScreenState {
  const factory HomeQuizScreenState({
    @Default(false) bool isLoading,
    @Default([]) final List<Quiz> filterQuizList,
    @Default([]) final List<String> categoryList, //クイズのカテゴリリスト
    @Default([]) final List<String> randomCategoryList, //ランダムモーダルの出題状況,
    @Default([]) final List<StatusType> statusList, //クイズ出題状況
    @Default([]) final List<StatusType> selectedStatusList, //クイズ出題状況
    @Default([]) final List<ImportanceType> selectedImportanceList, //重要度
    @Default([]) final List<double> correctRatios,
    @Default("") final String selectCategory,
    @Default(0) final int itemIndex, //クイズ番号
    @Default(0) final int tabIndex, //クイズ番号
    @Default(true) bool isQuizStatusRecommend, //おまかせモードか？
    @Default([]) final List<String> selectedFilterGroup,
    @Default(10) final int selectedStudyLength,
    @Default(10) final int selectedTestLength,
    @Default(10) final int selectedWeakLength,
    Quiz? selectQuiz,
    Quiz? selectStudyQuiz,
    Quiz? selectWeakQuiz, //苦手克服
    @Default(false) final bool isRepeat,
    @Default(false) final bool isSaved,
    @Default(false) final bool isWeak,
  }) = _HomeQuizScreenState;
}
