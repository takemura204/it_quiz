part of '../quizzes_resource.dart';

extension Category0Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category0QuizList {
    final quizList = [
      Quiz(
        title: "重要単語①",
        quizItemList: category0_1,
      ),
      Quiz(
        title: "重要単語②",
        quizItemList: category0_2,
      ),
      Quiz(
        title: "重要単語③",
        quizItemList: category0_3,
      ),
      Quiz(
        title: "重要単語④",
        quizItemList: category0_4,
      ),
      Quiz(
        title: "重要単語⑤",
        quizItemList: category0_5,
      ),
      Quiz(
        title: "重要単語⑥",
        quizItemList: category0_6,
      ),
      Quiz(
        title: "重要単語⑦",
        quizItemList: category0_7,
      ),
      Quiz(
        title: "重要単語⑧",
        quizItemList: category0_8,
      ),
      Quiz(
        title: "重要単語⑨",
        quizItemList: category0_9,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 0, category: I18n().setCategory(0), id: index + 1);
    });
  }
}
