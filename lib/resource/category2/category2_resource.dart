part of '../quizzes_resource.dart';

extension Category2Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category2QuizList {
    final quizList = [
      Quiz(
        title: "システム開発技術①",
        quizItemList: category2_1,
      ),
      Quiz(
        title: "システム開発技術②",
        quizItemList: category2_2,
      ),
      Quiz(
        title: "開発プロセス・手法①",
        quizItemList: category2_3,
      ),
      Quiz(
        title: "開発プロセス・手法②",
        quizItemList: category2_4,
      ),
      Quiz(
        title: "プロジェクトマネジメント",
        quizItemList: category2_5,
      ),
      Quiz(
        title: "サービス/ファシリティマネジメント",
        quizItemList: category2_6,
      ),
      Quiz(
        title: "サービスサポート",
        quizItemList: category2_7,
      ),
      Quiz(
        title: "システム監査",
        quizItemList: category2_8,
      ),
      Quiz(
        title: "内部統制",
        quizItemList: category2_9,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 2, category: I18n().setCategory(2), id: index + 1 + 200);
    });
  }
}
