part of '../quizzes_resource.dart';

extension Category0Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category0QuizList {
    final quizList = [
      Quiz(
        title: "重要単語①",
        quizItemList: category0_1,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語②",
        quizItemList: category0_2,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語③",
        quizItemList: category0_3,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語④",
        quizItemList: category0_4,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語⑤",
        quizItemList: category0_5,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語⑥",
        quizItemList: category0_6,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語⑦",
        quizItemList: category0_7,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語⑧",
        quizItemList: category0_8,
        isPremium: false,
      ),
      Quiz(
        title: "重要単語⑨",
        quizItemList: category0_9,
        isPremium: false,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 0, category: I18n().setCategory(0), id: index + 1);
    });
  }
}
