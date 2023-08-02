import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz/quiz.dart';

part 'home_review_screen_state.freezed.dart';

@freezed
class HomeReviewScreenState with _$HomeReviewScreenState {
  const factory HomeReviewScreenState({
    @Default([]) final List<Quiz> reviewItem,
    @Default(defaultWeakQuiz) final Quiz weakQuiz, //苦手克服
    @Default(defaultDilyQuiz) dailyQuiz, //今日のクイズ
    @Default(defaultTestQuiz)  testQuiz, //全てのクイズ
    @Default(0) final int testScore, //全てのクイズ
    @Default(false) bool isSelected,
    @Default([]) final List<String> testGroup,
    @Default(10) final int selectedTestLength,
    @Default(0) final int runningDay, //継続日数
  }) = _Create;
}


///今日のクイズ
const defaultDilyQuiz =  Quiz(
  id: 1,
  category: "review",
  title: "今日のクイズ",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);

///苦手克服
const defaultWeakQuiz = Quiz(
  id: 2,
  category: "review",
  title: "苦手克服",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);

///力だめし
const defaultTestQuiz = Quiz(
  id: 3,
  category: "review",
  title: "力だめし",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);