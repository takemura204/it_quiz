import 'package:kentei_quiz/resource/category1/category1_4.dart';

import '../model/lang/initial_resource.dart';
import '../model/quiz/quiz.dart';
import '../model/quiz/quiz_model.dart';
import 'category0/category0_1_1.dart';
import 'category0/category0_1_2.dart';
import 'category0/category0_1_3.dart';
import 'category0/category0_1_4.dart';
import 'category0/category0_2_1.dart';
import 'category0/category0_2_2.dart';
import 'category0/category0_2_3.dart';
import 'category0/category0_2_4.dart';
import 'category0/category0_3_1.dart';
import 'category0/category0_3_2.dart';
import 'category0/category0_3_3.dart';
import 'category0/category0_3_4.dart';
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
import 'category1/category1_3.dart';
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
import 'category3/category3_3.dart';
import 'category3/category3_4.dart';
import 'category3/category3_5.dart';
import 'category3/category3_6.dart';
import 'category3/category3_7.dart';
import 'category3/category3_8.dart';
import 'category3/category3_9.dart';

part 'category0/category0_resource.dart';
part 'category1/category1_resource.dart';
part 'category2/category2_resource.dart';
part 'category3/category3_resource.dart';

extension QuizModelEx on QuizModel {
  List<Quiz> get initQuizList {
    final quizList =
        // category0QuizList +
        category1QuizList + category2QuizList + category3QuizList;

    return quizList;
  }
}
