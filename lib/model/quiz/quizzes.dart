import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';

part 'quizzes.freezed.dart';
part 'quizzes.g.dart';

///問題ジャンル
@freezed
class Quizzes with _$Quizzes {
  factory Quizzes({
    @Default([]) final List<Quiz> quizList, //クイズ一覧
    @Default([]) final List<Quiz> userQuizList, //ユーザーが解いたクイズ一覧
    @Default(initDailyQuiz) Quiz dailyQuiz, //今日のクイズ
    @Default(initWeakQuiz) Quiz weakQuiz, //苦手克服
    @Default(initTestQuiz) Quiz testQuiz, //テストクイズ
    @Default(0) final int selectQuizIndex, //選択したクイズ
    @Default(QuizType.study) final QuizType quizType, //クイズタイプ
  }) = _Quizzes;

  Quizzes._();

  factory Quizzes.fromJson(Map<String, dynamic> json) =>
      _$QuizzesFromJson(json);
}

enum QuizType {
  study,
  weak,
  daily,
  test,
}

const initDailyQuiz = Quiz(
  id: 1,
  category: "review",
  title: "今日のクイズ",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);

///苦手克服
const initWeakQuiz = Quiz(
  id: 2,
  category: "review",
  title: "苦手克服",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);

///力だめし
const initTestQuiz = Quiz(
  id: 3,
  category: "review",
  title: "力だめし",
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
);
