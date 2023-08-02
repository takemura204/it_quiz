import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_item.dart';
import '../home_review/home_review_screen_controller.dart';

final quizChoiceScreenProvider =
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin {
  QuizChoiceScreenController({required this.ref, required this.quiz})
      : super(const QuizChoiceScreenState()) {
    initState();
  }
  final Ref ref;
  Quiz quiz;

  @override
  void initState() {
    _addQuizList(); //クイズ追加
    _shuffleChoice(); //選択肢表示
    super.initState();
  }

  ///クイズ更新
  void _addQuizList() {
    //クイズリスト更新
    final quizList = [...state.quizList];
    quizList.addAll(quiz.quizItemList);
    state = state.copyWith(quizList: quizList);
  }

  ///選択肢を混ぜる
  void _shuffleChoice() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [...quiz.quizItemList[state.quizIndex].choices];
    argumentsChoices.shuffle();
    choices.addAll(argumentsChoices);
    state = state.copyWith(choices: choices);
  }

  ///選択肢を押した時
  void tapChoiceButton(String choice) {
    _judgementQuiz(choice); //正誤判定,スコア判定
    _switchAnsView(); //答え表示,次の問題
  }

  ///クイズ判定
  void _judgementQuiz(String choice) {
    final quizList = [...state.quizList];
    final quizIndex = state.quizIndex;
    //正解
    if (choice == quizList[quizIndex].ans) {
      quizList[quizIndex] = QuizItem(
        quizId: quizList[quizIndex].quizId,
        question: quizList[quizIndex].question,
        ans: quizList[quizIndex].ans,
        choices: quizList[quizIndex].choices,
        comment: quizList[quizIndex].comment,
        isJudge: true, //正解
        isWeak: false, //苦手リスト除外
      );
      state = state.copyWith(isJudge: true, quizList: quizList);
    }
    //不正解
    else {
      quizList[quizIndex] = QuizItem(
        quizId: quizList[quizIndex].quizId,
        question: quizList[quizIndex].question,
        ans: quizList[quizIndex].ans,
        choices: quizList[quizIndex].choices,
        comment: quizList[quizIndex].comment,
        isJudge: false, //不正解
        isWeak: true, //苦手リスト追加
      );
      state = state.copyWith(isJudge: false, quizList: quizList);
    }
  }

  ///正解表示
  void _switchAnsView() {
    state = state.copyWith(isAnsView: true);
    Future.delayed(const Duration(milliseconds: 800), () {
      state = state.copyWith(isAnsView: false);
      //次のクイズ
      _nextQuiz();
    });
  }

  ///次の問題
  void _nextQuiz() {
    final quizIndex = state.quizIndex;
    //問題が終わった時
    if (quizIndex == quiz.quizItemList.length - 1) {
      state = state.copyWith(quizIndex: 0, isResultScreen: true);
      _updateItem();
    }
    //問題がまだある時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
    _shuffleChoice();
  }

  ///チェックボックス切り替え
  void tapCheckBox(int index) {
    final quizList = [...state.quizList];
    quizList[index] = QuizItem(
      quizId: quizList[index].quizId,
      question: quizList[index].question,
      ans: quizList[index].ans,
      comment: quizList[index].comment,
      isWeak: !quizList[index].isWeak,
      isJudge: quizList[index].isJudge,
      choices: quizList[index].choices,
    );
    state = state.copyWith(quizList: quizList);
    ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
  }

  ///クリアボタン
  void resetScreen() {
    state = state.copyWith(
      quizItemIndex: 0,
      quizIndex: 0,
      isAnsView: false,
      isResultScreen: false,
    );
  }

  ///クイズ結果更新(端末保存)
  void _updateItem() {
    final quizList = state.quizList;
    ref.read(quizModelProvider.notifier).updateItem(quizList);
  }
}
