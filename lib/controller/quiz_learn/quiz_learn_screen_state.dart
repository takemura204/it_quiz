import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

part 'quiz_learn_screen_state.freezed.dart';

@freezed
class QuizLearnScreenState with _$QuizLearnScreenState {
  const QuizLearnScreenState._();

  const factory QuizLearnScreenState({
    @Default(false) final bool isAnsView,
    @Default(false) final bool isRepeat,
    @Default(false) final bool isResultScreen,
    @Default(0) final int itemIndex,
    @Default(0) final int lapIndex,
    @Default([]) final List<QuizItem> quizItemList,
    @Default([]) final List<QuizItem> knowQuizItemList,
    @Default([]) final List<QuizItem> unKnowQuizItemList,
    @Default(Duration.zero) final Duration duration, // 学習時間
    @Default(StudyType.learn) final StudyType studyType, //クイズタイプ
    Quiz? learnQuiz,
    AppinioSwiperDirection? direction,
  }) = _QuizLearnScreenState;
}
