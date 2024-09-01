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
    StateNotifierProvider<QuizChoiceScreenController, QuizChoiceScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizChoiceScreenController extends StateNotifier<QuizChoiceScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizChoiceScreenController({required this.ref, required this.quiz})
      : super(const QuizChoiceScreenState()) {
    initState();
  }

  final Ref ref;
  Quiz quiz;
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    _startStopwatch(); //学習時間計測
    _loadQuizList(); //クイズ読み込み
    _shuffleChoice(); //選択肢ランダム表示
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
    final choiceQuiz = quiz;
    final quizItemList = [...state.quizItemList];
    final newQuizItems = [...quiz.quizItemList];
    newQuizItems.shuffle();
    quizItemList.addAll(newQuizItems);
    state = state.copyWith(choiceQuiz: choiceQuiz, quizItemList: quizItemList);
  }

  ///学習時間計測
  void _startStopwatch() {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
  }

  ///選択肢を混ぜる
  void _shuffleChoice() {
    final choices = [...state.choices]..clear();
    final argumentsChoices = [...state.quizItemList[state.quizIndex].choices];
    argumentsChoices.shuffle();
    choices.addAll(argumentsChoices);
    state = state.copyWith(choices: choices);
  }

  ///選択肢を押した時
  void tapAnsButton(String ans) {
    _setSelectAns(ans);
    _judgeQuiz(); //正誤判定,スコア判定
    _switchAnsView(); //答え表示,次の問題
  }

  void _setSelectAns(String ans) {
    state = state.copyWith(selectAns: ans);
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

  ///正解表示
  void _switchAnsView() {
    state = state.copyWith(isAnsView: true);
    Future.delayed(const Duration(milliseconds: 900), () {
      state = state.copyWith(isAnsView: false, selectAns: '');
      _nextQuiz(); //次のクイズ
    });
  }

  void setStudyType(StudyType studyType) {
    state = state.copyWith(studyType: studyType);
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
    _shuffleChoice();
  }

  ///チェックボックス切り替え
  void tapCheckBox(int index) {
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

  void tapSaveButton(int index) {
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
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
    ref.read(homeQuizScreenProvider.notifier).updateSelectQuiz(updateQuiz);
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
