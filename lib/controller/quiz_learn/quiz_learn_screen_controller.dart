import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';

final quizLearnScreenProvider =
    StateNotifierProvider<QuizLearnScreenController, QuizLearnScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizLearnScreenController extends StateNotifier<QuizLearnScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizLearnScreenController({required this.ref, required this.quiz})
      : super(const QuizLearnScreenState()) {
    initState();
  }

  final Ref ref;
  Quiz quiz;
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    _startStopwatch(); //学習時間計測
    _loadQuizList();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _stopwatch.start(); // アプリが前面に戻ったときにタイマーを再開
    } else if (state == AppLifecycleState.paused) {
      _stopwatch.stop(); // アプリが背景に移動したときにタイマーを停止
    }
  }

  ///クイズ更新
  void _loadQuizList() {
    //クイズリスト更新
    final quizItemList = [...state.quizItemList];
    quizItemList.addAll(quiz.quizItemList);
    state = state.copyWith(quizItemList: quizItemList);
  }

  ///学習時間計測
  void _startStopwatch() {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
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
    final quizItemList = [...state.quizItemList];
    final index = state.quizIndex;
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: quizItemList[index].isWeak,
      isJudge: isJudge,
      //更新
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
    );
  }

  ///「知っている・知らない」リストに追加
  void _addQuiz(bool isJudge) {
    final quizItemList = [...state.quizItemList];
    final knowQuizItemList = [...state.knowQuizItemList];
    final unKnowQuizItemList = [...state.unKnowQuizItemList];
    final quizIndex = state.quizIndex;

    ///知っている
    if (isJudge) {
      //すでに知ってるリストに含まれているとき
      if (knowQuizItemList.contains(quizItemList[quizIndex])) {
      }
      //、知らないリストに含まれている場合
      else if (unKnowQuizItemList.contains(quizItemList[quizIndex])) {
        knowQuizItemList.add(quizItemList[quizIndex]);
        unKnowQuizItemList.remove(quizItemList[quizIndex]);
      }
      //それ以外
      else {
        knowQuizItemList.add(quizItemList[quizIndex]);
      }
    }

    ///知らない
    else {
      //すでに含まれている場合
      if (unKnowQuizItemList.contains(quizItemList[state.quizIndex])) {
      }
      //知ってるリストに含まれている場合
      else if (knowQuizItemList.contains(quizItemList[state.quizIndex])) {
        knowQuizItemList.remove(quizItemList[state.quizIndex]);
        unKnowQuizItemList.add(quizItemList[state.quizIndex]);
      }
      //それ以外
      else {
        unKnowQuizItemList.add(quizItemList[state.quizIndex]);
      }
    }
    state = state.copyWith(
      knowQuizItemList: knowQuizItemList,
      unKnowQuizItemList: unKnowQuizItemList,
      quizItemList: quizItemList,
    );
  }

  ///次の問題に進む
  void _nextQuiz() {
    final quizIndex = state.quizIndex;
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final knowQuizList = [...state.knowQuizItemList];
    final unKnowQuizList = [...state.unKnowQuizItemList];
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (quizIndex == quizItemList.length - 1 &&
        knowQuizList.length != quiz.quizItemList.length) {
      quizItemList.clear();
      quizItemList.addAll(unKnowQuizList);
      state = state.copyWith(
          quizIndex: 0, lapIndex: lapIndex + 1, quizItemList: quizItemList);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowQuizItemList.length == quiz.quizItemList.length) {
      quizItemList.clear();
      quizItemList.addAll(quiz.quizItemList);
      _stopwatch.stop();
      state = state.copyWith(
        duration: _stopwatch.elapsed,
        quizIndex: 0,
        lapIndex: lapIndex + 1,
        isResultScreen: true,
        quizItemList: quizItemList,
      );
      _updateQuiz();
    }
    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
  }

  ///チェックボックス切り替え
  void tapCheckBox(int index) {
    final quizItemList = [...state.quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: !quizItemList[index].isWeak,
      isJudge: quizItemList[index].isJudge,
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
    );
    state = state.copyWith(quizItemList: quizItemList);

    _updateQuiz();
  }

  ///正解画面に切り替え
  void _switchAnsView() {
    state = state.copyWith(isAnsView: !state.isAnsView);
  }

  ///クイズ結果更新(端末保存)
  void _updateQuiz() {
    final quizItemList = state.quizItemList;
    final duration = state.duration;
    final updateQuiz = quiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      timeStamp: DateTime.now(),
    );
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      quizIndex: 0,
      lapIndex: 0,
      isAnsView: false,
      isResultScreen: false,
      knowQuizItemList: [],
      unKnowQuizItemList: [],
    );
  }
}
