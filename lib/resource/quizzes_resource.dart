import 'package:kentei_quiz/resource/category1/category1_4.dart';
import 'package:kentei_quiz/resource/quiz_resource.dart';

import '../model/lang/initial_resource.dart';
import '../model/quiz/quiz.dart';
import '../model/quiz/quiz_model.dart';
import 'category1/category1_1.dart';
import 'category1/category1_2.dart';
import 'category1/category1_3.dart';
import 'category1/category1_5.dart';
import 'category1/category1_6.dart';
import 'category1/category1_7.dart';
import 'category1/category1_8.dart';

part 'category1_resource.dart';

extension QuizModelEx on QuizModel {
  ///問題ジャンル
  List<Quiz> get initQuizList => [
        ...category1QuizList,
        Quiz(
          id: 1000,
          categoryId: 4,
          category: I18n().setCategory(3),
          title: "問題D-1",
          quizItemList: quiz1,
        ),
        Quiz(
          id: 1111,
          categoryId: 4,
          category: I18n().setCategory(2),
          title: "問題D-2",
          quizItemList: quiz2,
          correctNum: 0,
        ),
      ];

  ///苦手克服
  Quiz get initWeakQuiz => Quiz(
        id: 2,
        categoryId: 5,
        category: I18n().setCategory(5),
        title: "苦手克服",
        isCompleted: false,
        quizItemList: [],
        correctNum: 0,
        timeStamp: null,
        duration: Duration.zero,
        studyType: StudyType.learn,
      );

  ///力だめし
  Quiz get initTestQuiz => Quiz(
        id: 3,
        categoryId: 4,
        category: I18n().setCategory(4),
        title: "力だめし",
        isCompleted: false,
        quizItemList: [],
        correctNum: 0,
        timeStamp: null,
        duration: Duration.zero,
        studyType: StudyType.learn,
      );
}
