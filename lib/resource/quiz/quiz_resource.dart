import 'package:kentei_quiz/resource/quiz/quiz_choice/quiz_choice_resource.dart';
import 'package:kentei_quiz/resource/quiz/quiz_lean/quiz_lean_resource.dart';

import '../../entity/quiz_item.dart';

///問題ジャンル
List<QuizItem> studyItems = [
  QuizItem(
    id: 1,
    group: "TeamA",
    title: "問題A-1",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 2,
    group: "TeamA",
    title: "問題A-2",
    rememberQuiz: learnQuiz2,
    choiceQuiz: choiceQuiz2,
  ),
  QuizItem(
    id: 3,
    group: "TeamB",
    title: "問題B-1",
    rememberQuiz: learnQuiz3,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 4,
    group: "TeamB",
    title: "問題B-2",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 5,
    group: "TeamC",
    title: "問題C-1",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 6,
    group: "TeamC",
    title: "問題C-2",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 7,
    group: "TeamA",
    title: "問題A-3",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 8,
    group: "TeamB",
    title: "問題B-3",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 9,
    group: "TeamC",
    title: "問題C-3",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
  QuizItem(
    id: 10,
    group: "TeamD",
    title: "問題D-1",
    rememberQuiz: learnQuiz1,
    choiceQuiz: choiceQuiz1,
  ),
];

///「復習リスト」
List<QuizItem> reviewItem = [
  const QuizItem(
    id: 1,
    group: "rememberQuestions",
    title: "一問一答で復習する",
    rememberQuiz: [],
    choiceQuiz: [],
  ),
];
