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
    @Default(false) final bool isAnsView, //正解画面切り替え
    @Default(false) final bool isResultScreen, //結果画面切り替え
    @Default(0) final int quizIndex, //問題番号
    @Default(0) final int lapIndex, //何周目
    Quiz? learnQuiz,
    @Default([]) final List<QuizItem> quizItemList,
    @Default([]) final List<QuizItem> knowQuizItemList,
    @Default([]) final List<QuizItem> unKnowQuizItemList,
    @Default(Duration.zero) final Duration duration, // 所要時間
    @Default(StudyType.learn) final StudyType studyType, //クイズタイプ
    AppinioSwiperDirection? direction,
  }) = _Create;
}
