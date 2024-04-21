part of '../quizzes_resource.dart';

extension Category0Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category0QuizList {
    final quizList = [
      Quiz(
        title: "基本単語①",
        quizItemList: category0_1,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語②",
        quizItemList: category0_2,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語③",
        quizItemList: category0_3,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語④",
        quizItemList: category0_4,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語⑤",
        quizItemList: category0_5,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語⑥",
        quizItemList: category0_6,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語⑦",
        quizItemList: category0_7,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語⑧",
        quizItemList: category0_8,
        isPremium: false,
      ),
      Quiz(
        title: "基本単語⑨",
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
