import '../entity/quiz_item.dart';

///問題ジャンル
List<QuizItem> studyItems = [
  QuizItem(
    id: 1,
    group: "TeamA",
    title: "問題A-1",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 2,
    group: "TeamA",
    title: "問題A-2",
    rememberQuiz: rememberQuiz2,
  ),
  QuizItem(
    id: 3,
    group: "TeamB",
    title: "問題B-1",
    rememberQuiz: rememberQuiz3,
  ),
  QuizItem(
    id: 4,
    group: "TeamB",
    title: "問題B-2",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 5,
    group: "TeamC",
    title: "問題C-1",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 6,
    group: "TeamC",
    title: "問題C-2",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 7,
    group: "TeamA",
    title: "問題A-3",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 8,
    group: "TeamB",
    title: "問題B-3",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 9,
    group: "TeamC",
    title: "問題C-3",
    rememberQuiz: rememberQuiz1,
  ),
  QuizItem(
    id: 10,
    group: "TeamD",
    title: "問題D-1",
    rememberQuiz: rememberQuiz1,
  ),
];

///「復習リスト」
List<QuizItem> reviewItem = [
  const QuizItem(
    id: 1,
    group: "rememberQuestions",
    title: "一問一答で復習する",
    rememberQuiz: [],
  ),
];

///問題形式　<一問一答>
final List<RememberQuiz> rememberQuiz1 = [
  const RememberQuiz(
      questionId: 1, question: '1 + 1 = 2', ans: '2', isWeak: false),
  const RememberQuiz(
      questionId: 2, question: '更新世は氷河時代とも呼ばれる', ans: '氷河時代', isWeak: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isWeak: false),
];

final List<RememberQuiz> rememberQuiz2 = [
  const RememberQuiz(
      questionId: 1, question: '2 + 2 = 4', ans: '4', isWeak: false),
  const RememberQuiz(
      questionId: 2, question: '更新世 氷河時代 とも呼ばれる', ans: '氷河時代', isWeak: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、タンペムという反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる。\n',
      ans: 'タンペム',
      isWeak: false),
  const RememberQuiz(
      questionId: 4, question: '今は4問目！\n', ans: '4', isWeak: false),
];

final List<RememberQuiz> rememberQuiz3 = [
  const RememberQuiz(
      questionId: 1, question: '3 + 3 = 6', ans: '6', isWeak: false),
  const RememberQuiz(
      questionId: 2, question: '更新世 氷河時代 とも呼ばれる', ans: '氷河時代', isWeak: false),
  const RememberQuiz(
      questionId: 3,
      question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.\n',
      ans: 'タンペム',
      isWeak: false),
];
