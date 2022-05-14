import '../entity/quiz_item/quiz_item.dart';

///問題ジャンル
List<QuizItem>? quizItems = [
  QuizItem(id: 1, group: "TeamA", title: "問題A-1", oneQuestions: rememberQuiz1),
  QuizItem(id: 2, group: "TeamA", title: "問題A-2", oneQuestions: rememberQuiz2),
  QuizItem(id: 3, group: "TeamB", title: "問題B-1", oneQuestions: rememberQuiz3),
  QuizItem(id: 4, group: "TeamB", title: "問題B-2", oneQuestions: rememberQuiz1),
  QuizItem(id: 5, group: "TeamC", title: "問題C-1", oneQuestions: rememberQuiz1),
  QuizItem(id: 6, group: "TeamC", title: "問題C-2", oneQuestions: rememberQuiz1),
  QuizItem(id: 7, group: "TeamA", title: "問題A-3", oneQuestions: rememberQuiz1),
  QuizItem(id: 8, group: "TeamB", title: "問題B-3", oneQuestions: rememberQuiz1),
  QuizItem(id: 9, group: "TeamC", title: "問題C-3", oneQuestions: rememberQuiz1),
  QuizItem(id: 10, group: "TeamD", title: "問題D-1", oneQuestions: rememberQuiz1),
];

///問題形式　<一問一答>
final List<RememberQuiz> rememberQuiz1 = [
  const RememberQuiz(
      questionId: 1, question: '1 + 1 = 2', ans: '2', isKnow: false),
  const RememberQuiz(
      questionId: 2, question: '更新世 氷河時代 とも呼ばれる', ans: '氷河時代', isKnow: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isKnow: false),
];

final List<RememberQuiz> rememberQuiz2 = [
  const RememberQuiz(
      questionId: 1, question: '2 + 2 = 4', ans: '4', isKnow: false),
  const RememberQuiz(
      questionId: 2, question: '更新世 氷河時代 とも呼ばれる', ans: '氷河時代', isKnow: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isKnow: false),
];

final List<RememberQuiz> rememberQuiz3 = [
  const RememberQuiz(
      questionId: 1, question: '3 + 3 = 6', ans: '6', isKnow: false),
  const RememberQuiz(
      questionId: 2, question: '更新世 氷河時代 とも呼ばれる', ans: '氷河時代', isKnow: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isKnow: false),
];
