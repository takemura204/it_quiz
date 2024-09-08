import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import '../admob/admob_controller.dart';
import '../main/main_screen_controller.dart';

final quizLearnScreenProvider =
    StateNotifierProvider.autoDispose<QuizLearnScreenController, QuizLearnScreenState>(
  (ref) => throw UnimplementedError(),
);

class QuizLearnScreenController extends StateNotifier<QuizLearnScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  QuizLearnScreenController({required this.ref, required this.quiz})
      : super(const QuizLearnScreenState()) {
    _initState();
  }

  final Ref ref;
  final Quiz quiz;
  final Stopwatch _stopwatch = Stopwatch();
  late AppinioSwiperController swiperController;

  Future _initState() async {
    swiperController = AppinioSwiperController();
    await startStopwatch(); //学習時間計測
    await _initLearnQuiz();
    await _initIsRepeat();
    ref.read(quizModelProvider.notifier).setStudyType(StudyType.learn);
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
  Future _initLearnQuiz() async {
    final learnQuiz = quiz;
    final quizItemList = [...learnQuiz.quizItemList];
    state = state.copyWith(learnQuiz: learnQuiz, quizItemList: quizItemList);
  }

  Future _initIsRepeat() async {
    final prefs = await SharedPreferences.getInstance();
    const isRepeatName = 'quiz_is_repeat';
    final isRepeatData = prefs.getBool(isRepeatName);
    if (isRepeatData != null) {
      state = state.copyWith(isRepeat: isRepeatData);
    }
    print(isRepeatName);
  }

  ///学習時間計測
  Future startStopwatch() async {
    WidgetsBinding.instance.addObserver(this);
    _stopwatch.start(); //学習時間記録
  }

  ///「知っている・知らない」ボタンを押した時
  Future updateHomeLearnQuizItem(bool isKnow) async {
    await setIsAnsView(false);
    await setDirection(null);
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final itemIndex = state.itemIndex;
    final quizId = quizItemList[itemIndex].quizId;

    // QuizItem更新
    quizItemList[itemIndex] = QuizItem(
      quizId: quizItemList[itemIndex].quizId,
      word: quizItemList[itemIndex].word,
      comment: quizItemList[itemIndex].comment,
      question: quizItemList[itemIndex].question,
      choices: quizItemList[itemIndex].choices,
      ans: quizItemList[itemIndex].ans,
      isWeak: quizItemList[itemIndex].isWeak,
      isKnow: isKnow,
      status: isKnow && quizItemList[itemIndex].status == StatusType.unlearned
          ? StatusType.learned
          : quizItemList[itemIndex].status,
      importance: quizItemList[itemIndex].importance,
      isSaved: quizItemList[itemIndex].isSaved,
      lapIndex: lapIndex,
      source: quizItemList[itemIndex].source,
      isPremium: quizItemList[itemIndex].isPremium,
    );

    // リストの更新
    final knowQuizItemList = [...state.knowQuizItemList];
    final unKnowQuizItemList = [...state.unKnowQuizItemList];

    final isAlreadyKnown = knowQuizItemList.any((x) => x.quizId == quizId);
    final isAlreadyUnknown = unKnowQuizItemList.any((x) => x.quizId == quizId);
    if (isKnow) {
      //unKnowQuizItemListに含まれている時
      if (isAlreadyUnknown) {
        unKnowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      //knowQuizItemListに含まれている時
      if (isAlreadyKnown) {
        knowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      knowQuizItemList.add(quizItemList[itemIndex]);
    } else {
      //knowQuizItemListに含まれている時
      if (isAlreadyKnown) {
        knowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      //unKnowQuizItemListに含まれていない時
      if (isAlreadyUnknown) {
        unKnowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      unKnowQuizItemList.add(quizItemList[itemIndex]);
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
    final itemIndex = state.itemIndex;
    final quizItemList = [...state.quizItemList];
    final knowQuizItemList = [...state.knowQuizItemList];
    final unKnowQuizItemList = [...state.unKnowQuizItemList];
    final isRepeat = state.isRepeat;
    //クイズが完了したが、「知らない」がまだ含まれる場合
    if (itemIndex == quizItemList.length - 1) {
      //「知らない」用語を繰り返す場合
      if (isRepeat && unKnowQuizItemList.isNotEmpty) {
        _updateQuizItem(quizItemList[itemIndex]);
        quizItemList.clear();
        quizItemList
            .addAll([...state.unKnowQuizItemList]..sort((a, b) => a.quizId.compareTo(b.quizId)));
        state = state.copyWith(
          quizItemList: quizItemList,
          knowQuizItemList: knowQuizItemList,
          unKnowQuizItemList: [],
          itemIndex: 0,
          lapIndex: state.lapIndex + 1,
        );
      }
      //リザルト画面に移動
      else {
        final isPremium = ref.read(authModelProvider).isPremium;
        if (!isPremium) {
          ref.read(adMobProvider.notifier).showAdInterstitial();
        }

        ref.read(mainScreenControllerProvider.notifier).updateInAppReviewCount();

        setIsResultScreen(true);
        _updateQuizItem(quizItemList[itemIndex]);
        quizItemList.clear();
        quizItemList.addAll([...state.knowQuizItemList, ...state.unKnowQuizItemList]
          ..sort((a, b) => a.quizId.compareTo(b.quizId)));
        _stopwatch.stop();
        state = state.copyWith(
          quizItemList: quizItemList,
          knowQuizItemList: [],
          unKnowQuizItemList: [],
          duration: _stopwatch.elapsed,
          lapIndex: 0,
        );
        updateHistoryQuiz();
      }
    }
    //まだ問題が続けられる時
    else {
      state = state.copyWith(
        itemIndex: itemIndex + 1,
        quizItemList: quizItemList,
      );
      _updateQuizItem(quizItemList[itemIndex]);
    }
  }

  ///クイズ結果更新
  void _updateQuizItem(QuizItem quizItem) {
    ref.read(quizModelProvider.notifier).updateQuizItem(quizItem);
  }

  ///クイズ結果更新(端末保存)
  void updateHistoryQuiz() {
    final quizItemList = [...state.quizItemList]..sort((a, b) => a.quizId.compareTo(b.quizId));
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;
    final updateQuiz = quiz.copyWith(
      duration: duration,
      quizItemList: quizItemList,
      timeStamp: DateTime.now(),
      studyType: studyType,
    );
    ref.read(quizModelProvider.notifier).createHistoryQuiz(updateQuiz);
  }

  ///クイズ結果更新(端末保存)
  void updateStudyQuizItemList(List<QuizItem> quizItemList) {
    state = state.copyWith(
      quizItemList: quizItemList,
      knowQuizItemList: [],
      unKnowQuizItemList: [],
      itemIndex: 0,
      isAnsView: false,
    );
  }

  void restartLearnQuiz() {
    _initLearnQuiz();
    state = state.copyWith(
      quizItemList: state.quizItemList,
      knowQuizItemList: [],
      unKnowQuizItemList: [],
      itemIndex: 0,
    );
    setIsResultScreen(false);
    startStopwatch();
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
      choices: quizItemList[index].choices,
      source: quizItemList[index].source,
      isSaved: quizItemList[index].isSaved,
      isWeak: !quizItemList[index].isWeak,
      isKnow: quizItemList[index].isKnow,
      status: quizItemList[index].status,
      importance: quizItemList[index].importance,
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
    );
    state = state.copyWith(quizItemList: quizItemList);
    _updateQuizItem(quizItemList[index]);
  }

  ///保存ボタンをタップした時
  void tapSavedButton(int index) {
    final quizItemList = [...state.quizItemList];
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      word: quizItemList[index].word,
      question: quizItemList[index].question,
      ans: quizItemList[index].ans,
      comment: quizItemList[index].comment,
      isWeak: quizItemList[index].isWeak,
      isKnow: quizItemList[index].isKnow,
      status: quizItemList[index].status,
      isSaved: !quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
      source: quizItemList[index].source,
      importance: quizItemList[index].importance,
    );
    state = state.copyWith(quizItemList: quizItemList);
    _updateQuizItem(quizItemList[index]);
  }

  ///正解画面に切り替え
  Future setIsAnsView(bool value) async {
    state = state.copyWith(isAnsView: value);
  }

  ///リザルト画面に切り替え
  Future setIsResultScreen(bool value) async {
    state = state.copyWith(isResultScreen: value);
  }

  Future setDirection(AppinioSwiperDirection? direction) async {
    state = state.copyWith(direction: direction);
  }

  void setIsRepeat(bool value) {
    state = state.copyWith(isRepeat: value);
    print(state.isRepeat);
  }

  ///クリアボタン
  void tapClearButton() {
    state = state.copyWith(
      itemIndex: 0,
      lapIndex: 0,
      isAnsView: false,
      isResultScreen: false,
      knowQuizItemList: [],
      unKnowQuizItemList: [],
      learnQuiz: null,
    );
  }
}
