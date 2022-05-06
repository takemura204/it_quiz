import '../entity/quiz/quiz_one_question.dart';
import '../entity/quiz_item/quiz_item.dart';

List<QuizItem> quizItems = [
  const QuizItem(id: 1, group: "TeamA", title: "問題A-1", oneQuestions: []),
  const QuizItem(id: 2, group: "TeamA", title: "問題A-2", oneQuestions: []),
  const QuizItem(id: 3, group: "TeamB", title: "問題B-1", oneQuestions: []),
  const QuizItem(id: 4, group: "TeamB", title: "問題B-2", oneQuestions: []),
  const QuizItem(id: 5, group: "TeamC", title: "問題C-1", oneQuestions: []),
  const QuizItem(id: 6, group: "TeamC", title: "問題C-2", oneQuestions: []),
  const QuizItem(id: 7, group: "TeamA", title: "問題A-3", oneQuestions: []),
  const QuizItem(id: 8, group: "TeamB", title: "問題B-3", oneQuestions: []),
  const QuizItem(id: 9, group: "TeamC", title: "問題C-3", oneQuestions: []),
  const QuizItem(id: 10, group: "TeamD", title: "問題D-1", oneQuestions: []),
];

const String ansHideText = "_____";

final List<OneQuestion> oneQuestions = [
  const OneQuestion(
      questionNumber: 1, question: '1+1=$ansHideText', ans: '2', isKnow: false),
  const OneQuestion(
      questionNumber: 2,
      question: '更新世は$ansHideTextとも呼ばれる',
      ans: '氷河時代',
      isKnow: false),
  const OneQuestion(
      questionNumber: 3,
      question:
          '猫の目には、$ansHideTextという反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isKnow: false),
];
