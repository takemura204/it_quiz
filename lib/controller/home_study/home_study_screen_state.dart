import 'package:appinio_swiper/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz_item/quiz_item.dart';

part 'home_study_screen_state.freezed.dart';

@freezed
class HomeStudyScreenState with _$HomeStudyScreenState {
  const factory HomeStudyScreenState({
    @Default(false) final bool isLoading,
    @Default(false) final bool isShowTutorial,
    @Default(false) final bool isAnsView,
    @Default([]) final List<QuizItem> quizItemList,
    @Default([]) final List<QuizItem> knowQuizItemList,
    @Default([]) final List<QuizItem> unKnowQuizItemList,
    @Default(0) final int itemIndex,
    @Default(0) final int lapIndex,
    AppinioSwiperDirection? direction,
  }) = _HomeStudyScreenState;
}
