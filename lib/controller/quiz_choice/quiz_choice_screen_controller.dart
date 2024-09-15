import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import '../admob/admob_controller.dart';
import '../home_quiz/home_quiz_screen_controller.dart';

final quizChoiceScreenProvider =
    StateNotifierProvider.autoDispose<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizChoiceScreenController({required this.ref, required this.quiz})
      : super(const QuizChoiceScreenState()) {
    _initState();
  }

  final Ref ref;
  Quiz quiz;
  final Stopwatch _stopwatch = Stopwatch();

  Future _initState() async {
    await _startStopwatch();
    await _initQuizList();
    await _initChoices();
    ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
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

  ///クイズ取得
  Future _initQuizList() async {
    final choiceQuiz = quiz;
    final quizItemList = [...choiceQuiz.quizItemList];
    quizItemList.shuffle();
    state = state.copyWith(
      choiceQuiz: choiceQuiz,
      quizItemList: quizItemList,
      quizIndex: 0,
    );
  }

  ///選択肢取得
  Future _initChoices() async {
    final choices = [...state.quizItemList[state.quizIndex].choices];
    choices.shuffle();
    state = state.copyWith(choices: choices);
  }

  ///学習時間計測
  Future _startStopwatch() async {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
  }

  ///選択肢を押した時
  void tapAnsButton(String ans) {
    _setSelectAns(ans);
    _judgeQuiz();
    _setIsAnsView();
  }

  void _setSelectAns(String ans) {
    state = state.copyWith(selectAns: ans);
  }

  Future _setIsResultScreen(bool value) async {
    state = state.copyWith(isResultScreen: value);
  }

  ///正解表示
  void _setIsAnsView() {
    state = state.copyWith(isAnsView: true);
    Future.delayed(const Duration(milliseconds: 900), () {
      state = state.copyWith(isAnsView: false, selectAns: '');
      _nextQuiz(); //次のクイズ
    });
  }

  ///クイズ判定
  void _judgeQuiz() {
    final ans = state.selectAns;
    final quizItemList = [...state.quizItemList];
    final quizIndex = state.quizIndex;
    //正解
    if (ans == quizItemList[quizIndex].ans) {
      quizItemList[quizIndex] = QuizItem(
        quizId: quizItemList[quizIndex].quizId,
        word: quizItemList[quizIndex].word,
        question: quizItemList[quizIndex].question,
        ans: quizItemList[quizIndex].ans,
        choices: quizItemList[quizIndex].choices,
        comment: quizItemList[quizIndex].comment,
        status: StatusType.correct,
        isSaved: quizItemList[quizIndex].isSaved,
        isWeak: false,
        lapIndex: quizItemList[quizIndex].lapIndex,
        isPremium: quizItemList[quizIndex].isPremium,
        source: quizItemList[quizIndex].source,
        importance: quizItemList[quizIndex].importance,
      );
      state = state.copyWith(isJudge: true, quizItemList: quizItemList);
      HapticFeedback.mediumImpact();
    }
    //不正解
    else {
      quizItemList[quizIndex] = QuizItem(
        quizId: quizItemList[quizIndex].quizId,
        word: quizItemList[quizIndex].word,
        question: quizItemList[quizIndex].question,
        ans: quizItemList[quizIndex].ans,
        choices: quizItemList[quizIndex].choices,
        comment: quizItemList[quizIndex].comment,
        status: StatusType.incorrect,
        isSaved: quizItemList[quizIndex].isSaved,
        isWeak: true,
        lapIndex: quizItemList[quizIndex].lapIndex,
        isPremium: quizItemList[quizIndex].isPremium,
        source: quizItemList[quizIndex].source,
        importance: quizItemList[quizIndex].importance,
      );
      state = state.copyWith(isJudge: false, quizItemList: quizItemList);
      HapticFeedback.lightImpact();
    }
  }

  ///次の問題
  void _nextQuiz() {
    final isPremium = ref.read(authModelProvider).isPremium;
    final quizIndex = state.quizIndex;

    //問題が終わった時
    if (quizIndex == state.quizItemList.length - 1) {
      _stopwatch.stop();
      state = state.copyWith(duration: _stopwatch.elapsed, quizIndex: 0, isResultScreen: true);
      if (!isPremium) {
        ref.read(adMobProvider.notifier).showAdInterstitial();
      }
      _updateQuiz();
      updateHistoryQuiz();
    }
    //問題がまだある時
    else {
      state = state.copyWith(quizIndex: quizIndex + 1);
    }
    _initChoices();
  }

  ///チェックボックス切り替え
  void tapWeakButton(int index) {
    final quizItemList = [...state.quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      word: quizItemList[index].word,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: !quizItemList[index].isWeak,
      status: quizItemList[index].status,
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
      source: quizItemList[index].source,
      importance: quizItemList[index].importance,
    );
    state = state.copyWith(quizItemList: quizItemList);

    _updateQuiz();
  }

  void tapSavedButton(int index) {
    final quizItemList = [...state.quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      word: quizItemList[index].word,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: quizItemList[index].isWeak,
      status: quizItemList[index].status,
      isSaved: !quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
      source: quizItemList[index].source,
      importance: quizItemList[index].importance,
    );
    state = state.copyWith(quizItemList: quizItemList);

    _updateQuiz();
  }

  Future restartChoiceQuiz() async {
    await _initQuizList();
    await _initChoices();
    await _startStopwatch();
    await _setIsResultScreen(false);
  }

  ///クリアボタン
  void resetScreen() {
    _stopwatch.reset();
    state = state.copyWith(
      quizItemIndex: 0,
      quizIndex: 0,
      isAnsView: false,
      isResultScreen: false,
    );
  }

  ///クイズ結果更新(端末保存)
  void _updateQuiz() {
    // state.quizItemList を変更可能なリストにコピー
    final quizItemList = List<QuizItem>.from(state.quizItemList);

    // コピーしたリストを並べ替える
    quizItemList.sort((a, b) => a.quizId.compareTo(b.quizId));
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;

    final choiceQuiz = state.choiceQuiz!;
    final updateQuiz = choiceQuiz.copyWith(
      duration: duration,
      quizItemList: updateQuizItemList(),
      timeStamp: DateTime.now(),
      studyType: studyType,
    );
    ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(updateQuiz);
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
  }

  List<QuizItem> updateQuizItemList() {
    // state.quizItemList を quizId ベースでマップに変換
    final stateQuizMap = {for (var item in state.quizItemList) item.quizId: item};
    final selectQuiz = ref.read(homeQuizScreenProvider).selectQuiz!;

    // quiz.quizItemList をイテレートして更新または追加
    final updatedQuizItemList = selectQuiz.quizItemList.map((quizItem) {
      // state.quizItemList に同じ quizId の要素があれば、その要素を使う
      if (stateQuizMap.containsKey(quizItem.quizId)) {
        return stateQuizMap[quizItem.quizId]!; // nullでないことを保証
      }
      // なければ新しい quizItem をそのまま使用
      return quizItem;
    }).toList();

    return updatedQuizItemList;
  }

  void updateHistoryQuiz() {
    final quizItemList = state.quizItemList;
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;
    final correctNum = quizItemList.where((x) => x.status == StatusType.correct).toList().length;
    final choiceQuiz = state.choiceQuiz!;
    final isCompleted = quizItemList.length == correctNum;
    final updateQuiz = choiceQuiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      correctNum: correctNum,
      isCompleted: isCompleted,
      timeStamp: DateTime.now(),
      studyType: studyType,
    );
    ref.read(quizModelProvider.notifier).createHistoryQuiz(updateQuiz);
  }
}
