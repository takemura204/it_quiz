part of 'quizzes_resource.dart';

extension Category1Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category1QuizList => [
        Quiz(
          id: 1,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "経営・組織論①",
          quizItemList: category1_1,
        ),
        Quiz(
          id: 2,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "経営・組織論②",
          quizItemList: category1_2,
        ),
        Quiz(
          id: 3,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "経営・組織論③",
          quizItemList: category1_3,
        ),
        Quiz(
          id: 4,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "経営・組織論④",
          quizItemList: category1_4,
        ),
        Quiz(
          id: 5,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "経営・組織論⑤",
          quizItemList: category1_5,
        ),
        Quiz(
          id: 6,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "分析・データ活用①",
          quizItemList: category1_6,
        ),
        Quiz(
          id: 7,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "分析・データ活用②",
          quizItemList: category1_7,
        ),
        Quiz(
          id: 8,
          categoryId: 1,
          category: I18n().setCategory(1),
          title: "分析・データ活用③",
          quizItemList: category1_8,
        ),
      ];

  ///苦手克服
  Quiz get initWeakQuiz => Quiz(
        id: 2,
        categoryId: 5,
        category: I18n().setCategory(5),
        title: "苦手克服",
        quizItemList: [],
      );

  ///力だめし
  Quiz get initTestQuiz => Quiz(
        id: 3,
        categoryId: 4,
        category: I18n().setCategory(6),
        title: "力だめし",
        quizItemList: [],
      );
}
