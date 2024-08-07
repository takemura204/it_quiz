import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:kentei_quiz/model/quiz_item/quiz_item.dart';

import '../../untils/enums.dart';

part 'quizzes.freezed.dart';
part 'quizzes.g.dart';

///問題ジャンル
@freezed
class Quizzes with _$Quizzes {
  factory Quizzes({
    @Default(false) bool isLoading,
    @Default(0) final int quizIndex, //選択したクイズインデックス
    @Default([]) final List<Quiz> quizList, //クイズ一覧
    @Default([]) final List<Quiz> historyQuizList, //学習したクイズリスト一覧
    @Default([]) final List<QuizItem> quizItemList,
    Quiz? weakQuiz, //苦手克服
    Quiz? randomQuiz, //ランダムクイズ
    @Default(QuizStyleType.study) final QuizStyleType quizType, //クイズタイプ
    @Default(StudyType.learn) final StudyType studyType, //クイズタイプ
  }) = _Quizzes;

  Quizzes._();

  factory Quizzes.fromJson(Map<String, dynamic> json) =>
      _$QuizzesFromJson(json);
}

///苦手克服
Quiz initWeakQuiz = Quiz(
  id: 1,
  categoryId: 5,
  category: I18n().setCategory(5),
  title: I18n().styleWeakQuiz,
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
  duration: Duration.zero,
  studyType: StudyType.learn,
);

///ランダム
Quiz initRandomQuiz = Quiz(
  id: 2,
  categoryId: 6,
  category: I18n().setCategory(6),
  title: I18n().styleRandomQuiz,
  isCompleted: false,
  quizItemList: [],
  correctNum: 0,
  timeStamp: null,
  duration: Duration.zero,
  studyType: StudyType.learn,
);
