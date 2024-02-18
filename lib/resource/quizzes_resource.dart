import 'package:kentei_quiz/resource/category1/category1_4.dart';

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
import 'category1/category1_38.dart';
import 'category1/category1_39.dart';
import 'category1/category1_40.dart';
import 'category1/category1_5.dart';
import 'category1/category1_6.dart';
import 'category1/category1_7.dart';
import 'category1/category1_8.dart';
import 'category1/category1_9.dart';
import 'category2/category2_1.dart';
import 'category2/category2_2.dart';
import 'category2/category2_3.dart';
import 'category2/category2_4.dart';
import 'category2/category2_5.dart';
import 'category2/category2_6.dart';
import 'category2/category2_7.dart';
import 'category2/category2_8.dart';
import 'category2/category2_9.dart';
import 'category3/category3_1.dart';
import 'category3/category3_10.dart';
import 'category3/category3_11.dart';
import 'category3/category3_12.dart';
import 'category3/category3_13.dart';
import 'category3/category3_14.dart';
import 'category3/category3_15.dart';
import 'category3/category3_16.dart';
import 'category3/category3_17.dart';
import 'category3/category3_18.dart';
import 'category3/category3_19.dart';
import 'category3/category3_2.dart';
import 'category3/category3_20.dart';
import 'category3/category3_21.dart';
import 'category3/category3_22.dart';
import 'category3/category3_23.dart';
import 'category3/category3_24.dart';
import 'category3/category3_25.dart';
import 'category3/category3_26.dart';
import 'category3/category3_27.dart';
import 'category3/category3_28.dart';
import 'category3/category3_29.dart';
import 'category3/category3_3.dart';
import 'category3/category3_30.dart';
import 'category3/category3_31.dart';
import 'category3/category3_32.dart';
import 'category3/category3_33.dart';
import 'category3/category3_34.dart';
import 'category3/category3_35.dart';
import 'category3/category3_36.dart';
import 'category3/category3_37.dart';
import 'category3/category3_38.dart';
import 'category3/category3_39.dart';
import 'category3/category3_4.dart';
import 'category3/category3_40.dart';
import 'category3/category3_41.dart';
import 'category3/category3_42.dart';
import 'category3/category3_43.dart';
import 'category3/category3_5.dart';
import 'category3/category3_6.dart';
import 'category3/category3_7.dart';
import 'category3/category3_8.dart';
import 'category3/category3_9.dart';

part 'category1/category1_resource.dart';

part 'category2/category2_resource.dart';

part 'category3/category3_resource.dart';

extension QuizModelEx on QuizModel {
  List<Quiz> get initQuizList {
    final quizList = category1QuizList + category2QuizList + category3QuizList;

    return quizList;
  }

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
