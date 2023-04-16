import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz_state.dart';

final quizLearnScreenProvider =
    StateNotifierProvider<QuizLearnScreenController, QuizLearnScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizLearnScreenController extends StateNotifier<QuizLearnScreenState>
    with LocatorMixin {
  QuizLearnScreenController({required this.ref, required this.item})
      : super(const QuizLearnScreenState()) {
    initState();
  }

  final Ref ref;
  QuizItemState item;

  @override
  void initState() {
    _addQuizList();
    super.initState();
  }

  ///クイズ更新
  void _addQuizList() {
    //クイズリスト更新
    final quizList = [...state.quizList];
    quizList.addAll(item.quizList);
    state = state.copyWith(quizList: quizList);
  }

  ///確認ボタンを押した時
  void tapConfirmButton() {
    _switchAnsView(); //画面切り替え
  }

  ///「知っている・知らない」ボタンを押した時
  void tapIsKnowButton(bool isKnow) {
    _setQuiz(isKnow); //更新
    _addQuiz(isKnow); //追加
    _nextQuiz(); //次の問題
    _switchAnsView(); // 画面切り替え
  }

  ///クイズ更新
  void _setQuiz(bool isJudge) {
    final quizList = [...state.quizList];
    final index = state.quizIndex;
    quizList[index] = QuizState(
      quizId: quizList[index].quizId,
      question: quizList[index].question,
      ans: quizList[index].ans,
      isWeak: quizList[index].isWeak,
      isJudge: isJudge, //更新
      choices: quizList[index].choices,
    );
  }

  ///「知っている・知らない」リストに追加
  void _addQuiz(bool isJudge) {
    final quizList = [...state.quizList];
    final knowQuizList = [...state.knowQuizList];
    final unKnowQuizList = [...state.unKnowQuizList];
    final quizIndex = state.quizIndex;

    ///知っている
    if (isJudge) {
      //すでに知ってるリストに含まれているとき
      if (knowQuizList.contains(quizList[quizIndex])) {
      }
      //、知らないリストに含まれている場合
      else if (unKnowQuizList.contains(quizList[quizIndex])) {
        knowQuizList.add(quizList[quizIndex]);
        unKnowQuizList.remove(quizList[quizIndex]);
      }
      //それ以外
      else {
        knowQuizList.add(quizList[quizIndex]);
      }
    }

    ///知らない
    else {
      //すでに含まれている場合
      if (unKnowQuizList.contains(quizList[state.quizIndex])) {
      }
      //知ってるリストに含まれている場合
      else if (knowQuizList.contains(quizList[state.quizIndex])) {
        knowQuizList.remove(quizList[state.quizIndex]);
        unKnowQuizList.add(quizList[state.quizIndex]);
      }
      //それ以外
      else {
        unKnowQuizList.add(quizList[state.quizIndex]);
      }
    }
    state = state.copyWith(
      knowQuizList: knowQuizList,
      unKnowQuizList: unKnowQuizList,
      quizList: quizList,
    );
  }

  ///次の問題に進む
  void _nextQuiz() {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    final quizList = [...state.quizList];
    final knowQuizList = [...state.knowQuizList];
    final unKnowQuizList = [...state.unKnowQuizList];
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (quizIndex == quizList.length - 1 &&
        knowQuizList.length != item.quizList.length) {
      quizList.clear();
      quizList.addAll(unKnowQuizList);
      state = state.copyWith(
          quizIndex: 0, lapIndex: lapIndex + 1, quizList: quizList);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowQuizList.length == item.quizList.length) {
      quizList.clear();
      quizList.addAll(item.quizList);
      state = state.copyWith(
          quizIndex: 0,
          lapIndex: lapIndex + 1,
          isResultScreen: true,
          quizList: quizList);
    }
    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///知っている問題のチェックボックス切り替え
  void switchKnowCheckBox(int index) {
    final quizList = [...state.quizList];
    //チェックした時
    if (!quizList[index].isWeak) {
      quizList[index] = QuizState(
        quizId: quizList[index].quizId,
        question: quizList[index].question,
        ans: quizList[index].ans,
        isWeak: true,
        isJudge: quizList[index].isJudge,
        choices: quizList[index].choices,
      );
    }
    //チェック外した時
    else {
      quizList[index] = QuizState(
        quizId: quizList[index].quizId,
        question: quizList[index].question,
        ans: quizList[index].ans,
        isWeak: false,
        isJudge: quizList[index].isJudge,
        choices: quizList[index].choices,
      );
    }
    state = state.copyWith(quizList: quizList);
  }

  ///正解画面に切り替え
  void _switchAnsView() {
    state = state.copyWith(isAnsView: !state.isAnsView);
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      quizIndex: 0,
      lapIndex: 0,
      isAnsView: false,
      isResultScreen: false,
      knowQuizList: [],
      unKnowQuizList: [],
    );
  }
}
