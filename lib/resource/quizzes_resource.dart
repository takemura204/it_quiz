import 'package:kentei_quiz/resource/category1/category1_4.dart';
import 'package:kentei_quiz/resource/quiz_resource.dart';

import '../model/lang/initial_resource.dart';
import '../model/quiz/quiz.dart';
import '../model/quiz/quiz_model.dart';
import 'category1/category1_1.dart';
import 'category1/category1_10.dart';
import 'category1/category1_11.dart';
import 'category1/category1_12.dart';
import 'category1/category1_13.dart';
import 'category1/category1_14.dart';
import 'category1/category1_15.dart';
import 'category1/category1_16.dart';
import 'category1/category1_17.dart';
import 'category1/category1_18.dart';
import 'category1/category1_19.dart';
import 'category1/category1_2.dart';
import 'category1/category1_20.dart';
import 'category1/category1_21.dart';
import 'category1/category1_22.dart';
import 'category1/category1_23.dart';
import 'category1/category1_24.dart';
import 'category1/category1_25.dart';
import 'category1/category1_26.dart';
import 'category1/category1_27.dart';
import 'category1/category1_28.dart';
import 'category1/category1_29.dart';
import 'category1/category1_3.dart';
import 'category1/category1_30.dart';
import 'category1/category1_31.dart';
import 'category1/category1_32.dart';
import 'category1/category1_33.dart';
import 'category1/category1_34.dart';
import 'category1/category1_35.dart';
import 'category1/category1_36.dart';
import 'category1/category1_37.dart';
import 'category1/category1_5.dart';
import 'category1/category1_6.dart';
import 'category1/category1_7.dart';
import 'category1/category1_8.dart';
import 'category1/category1_9.dart';

part 'category1_resource.dart';

extension QuizModelEx on QuizModel {
  ///問題ジャンル
  List<Quiz> get initQuizList => [
        ...category1QuizList,
        // Quiz(
        //   id: 1001,
        //   categoryId: 1,
        //   category: I18n().setCategory(1),
        //   title: "問題A-1",
        //   quizItemList: quiz1,
        // ),
        Quiz(
          id: 1002,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "問題B-1",
          quizItemList: quiz2,
        ),
        Quiz(
          id: 1111,
          categoryId: 3,
          category: I18n().setCategory(3),
          title: "問題D-1",
          quizItemList: quiz3,
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
