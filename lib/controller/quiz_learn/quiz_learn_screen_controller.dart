import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../admob/admob_controller.dart';

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
  late AppinioSwiperController swiperController;

  @override
  Future initState() async {
    swiperController = AppinioSwiperController();
    await _startStopwatch(); //学習時間計測
    _loadQuizList();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    swiperController.dispose();
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
  Future _startStopwatch() async {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
  }

  ///「知っている・知らない」ボタンを押した時
  Future tapActionButton(bool isKnow) async {
    await setIsAnsView(false);
    await setDirection(null);

    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final index = state.quizIndex;
    final quizId = quizItemList[index].quizId;

    // QuizItemを更新

    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: quizItemList[index].isWeak,
      isJudge: isKnow,
      isSaved: quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
      lapIndex: lapIndex,
      isPremium: quizItemList[index].isPremium,
    );

    // リストの更新
    final knowQuizItemList = [...state.knowQuizItemList];
    final unKnowQuizItemList = [...state.unKnowQuizItemList];

    final isAlreadyKnown = knowQuizItemList.any((x) => x.quizId == quizId);
    final isAlreadyUnknown = unKnowQuizItemList.any((x) => x.quizId == quizId);
    if (isKnow) {
      //knowQuizItemListに含まれていない時
      if (!isAlreadyKnown) {
        //unKnowQuizItemListに含まれている時
        if (isAlreadyUnknown) {
          unKnowQuizItemList.removeWhere((item) => item.quizId == quizId);
        }
        knowQuizItemList.add(quizItemList[index]);
      }
    } else {
      if (!isAlreadyUnknown) {
        if (isAlreadyKnown) {
          knowQuizItemList.removeWhere((item) => item.quizId == quizId);
        }
        unKnowQuizItemList.add(state.quizItemList[index]);
      }
    }

    // 状態の更新
    state = state.copyWith(
      knowQuizItemList: knowQuizItemList,
      unKnowQuizItemList: unKnowQuizItemList,
      quizItemList: quizItemList,
    );

    _nextQuiz();
  }

  ///次の問題に進む
  void _nextQuiz() {
    final index = state.quizIndex;
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final knowQuizList = [...state.knowQuizItemList];
    final unKnowQuizList = [...state.unKnowQuizItemList];
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (index == quizItemList.length - 1 &&
        knowQuizList.length != quiz.quizItemList.length) {
      quizItemList.clear();
      quizItemList.addAll(unKnowQuizList);
      state = state.copyWith(
          quizIndex: 0, lapIndex: lapIndex + 1, quizItemList: quizItemList);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowQuizItemList.length == quiz.quizItemList.length) {
      final isPremium = ref.read(authModelProvider).isPremium;
      quizItemList.clear(); // クイズアイテムリストをクリア
      // 知ってるリストと知らないリストを結合して、quizIdの昇順に並べ替え

      quizItemList.addAll([...knowQuizList, ...unKnowQuizList]
        ..sort((a, b) => a.quizId.compareTo(b.quizId)));
      _stopwatch.stop();
      state = state.copyWith(
        duration: _stopwatch.elapsed,
        quizIndex: 0,
        lapIndex: lapIndex + 1,
        isResultScreen: true,
        quizItemList: quizItemList,
      );

      if (!isPremium) {
        ref.read(adMobProvider.notifier).showAdInterstitial();
      }
      _updateQuiz();
    }

    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(quizIndex: index + 1);
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
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
    );
    state = state.copyWith(quizItemList: quizItemList);
    _updateQuiz();
  }

  ///正解画面に切り替え
  Future setIsAnsView(bool value) async {
    state = state.copyWith(isAnsView: value);
  }

  Future setDirection(AppinioSwiperDirection? direction) async {
    state = state.copyWith(direction: direction);
  }

  ///クイズ結果更新(端末保存)
  void _updateQuiz() {
    final quizItemList = state.quizItemList;
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;
    final updateQuiz = quiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      timeStamp: DateTime.now(),
      studyType: studyType,
    );
    ref.read(quizModelProvider.notifier).updateQuiz(updateQuiz);
  }

  void updateHistoryQuiz() {
    final quizItemList = state.quizItemList;
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;
    final correctNum =
        quizItemList.where((x) => x.isJudge == true).toList().length;
    final isCompleted = quizItemList.length == correctNum;
    final updateQuiz = quiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      correctNum: correctNum,
      isCompleted: isCompleted,
      timeStamp: DateTime.now(),
      studyType: studyType,
    );
    ref.read(quizModelProvider.notifier).addHistoryQuiz(updateQuiz);
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
