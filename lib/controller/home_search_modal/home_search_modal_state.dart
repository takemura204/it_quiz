import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/untils/enums.dart';

import '../../model/quiz/quiz.dart';

part 'home_search_modal_state.freezed.dart';

@freezed
class HomeSearchModalState with _$HomeSearchModalState {
  const factory HomeSearchModalState({
    @Default(false) final bool isLoading,
    @Default([]) final List<Quiz> filterQuizList,
    @Default([]) final List<String> categoryList,
    @Default([]) final List<Quiz> selectedCategoryQuizList,
    @Default([]) final List<StatusType> statusList,
    @Default([]) final List<StatusType> selectedStatusList,
    @Default([]) final List<ImportanceType> importanceList,
    @Default([]) final List<ImportanceType> selectedImportanceList,
    @Default(false) final bool isSaved,
    @Default(false) final bool isWeak,
  }) = _HomeSearchModalState;
}
