part of '../quizzes_resource.dart';

extension Category2Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category2QuizList => [
        Quiz(
          id: 1,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "システム開発技術①",
          quizItemList: category2_1,
        ),
        Quiz(
          id: 2,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "システム開発技術②",
          quizItemList: category2_2,
        ),
        Quiz(
          id: 3,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "開発プロセス・手法①",
          quizItemList: category2_3,
        ),
        Quiz(
          id: 4,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "開発プロセス・手法②",
          quizItemList: category2_4,
        ),
        Quiz(
          id: 5,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "プロジェクトマネジメント",
          quizItemList: category2_5,
        ),
        Quiz(
          id: 6,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "サービス/ファシリティマネジメント",
          quizItemList: category2_6,
        ),
        Quiz(
          id: 7,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "サービスサポート",
          quizItemList: category2_7,
        ),
        Quiz(
          id: 8,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "システム監査",
          quizItemList: category2_8,
        ),
        Quiz(
          id: 9,
          categoryId: 2,
          category: I18n().setCategory(2),
          title: "内部統制",
          quizItemList: category2_9,
        ),
      ];
}
