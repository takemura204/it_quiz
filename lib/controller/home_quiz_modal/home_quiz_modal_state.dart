import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/untils/enums.dart';

import '../../model/quiz_item/quiz_item.dart';

part 'home_quiz_modal_state.freezed.dart';

@freezed
class HomeQuizModalState with _$HomeQuizModalState {
  const factory HomeQuizModalState({
    @Default(false) final bool isLoading,
    @Default([]) final List<QuizItem> filterQuizItemList,
    @Default([]) final List<StatusType> statusList,
    @Default([]) final List<StatusType> selectedStatusList,
    @Default([]) final List<ImportanceType> importanceList,
    @Default([]) final List<ImportanceType> selectedImportanceList,
    @Default(5) final int quizItemCount,
    @Default(false) final bool isRepeat,
    @Default(false) final bool isSaved,
    @Default(false) final bool isWeak,
  }) = _HomeQuizModalState;
}
