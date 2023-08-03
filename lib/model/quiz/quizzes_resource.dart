part of 'quiz_model.dart';

extension QuizModelEx on QuizModel {
  ///問題ジャンル
  List<Quiz> get studyQuiz => [
    Quiz(
      id: 1,
      category: I18n().group1,
      title: "問題A-1",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 2,
      category: I18n().group1,
      title: "問題A-2",
      isCompleted: false,
      quizItemList: quiz2,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 3,
      category: I18n().group2,
      title: "問題B-1",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 4,
      category: I18n().group2,
      title: "問題B-2",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 5,
      category: I18n().group3,
      title: "問題C-1",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 6,
      category: I18n().group3,
      title: "問題C-2",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 7,
      category: I18n().group1,
      title: "問題A-3",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 8,
      category: I18n().group2,
      title: "問題B-3",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 9,
      category: I18n().group3,
      title: "問題C-3",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 10,
      category: I18n().group4,
      title: "問題D-1",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
    Quiz(
      id: 11,
      category: I18n().group4,
      title: "問題D-2",
      isCompleted: false,
      quizItemList: quiz1,
      correctNum: 0,
      timeStamp: null,
    ),
  ];

  ///今日のクイズ
  Quiz get dailyQuiz =>  Quiz(
    id: 1,
    category: "review",
    title: "今日のクイズ",
    isCompleted: false,
    quizItemList: [],
    correctNum: 0,
    timeStamp: null,
  );

  ///苦手克服
  Quiz get weakQuiz  =>  Quiz(
    id: 2,
    category: "review",
    title: "苦手克服",
    isCompleted: false,
    quizItemList: [],
    correctNum: 0,
    timeStamp: null,
  );

  ///力だめし
  Quiz get testQuiz =>  Quiz(
    id: 3,
    category: "review",
    title: "力だめし",
    isCompleted: false,
    quizItemList: [],
    correctNum: 0,
    timeStamp: null,
  );
}