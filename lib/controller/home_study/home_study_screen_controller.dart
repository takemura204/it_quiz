import 'dart:convert';

import 'package:appinio_swiper/controllers.dart';
import 'package:appinio_swiper/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import 'home_study_screen_state.dart';

final homeStudyScreenProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => HomeStudyScreenController(ref: ref),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  HomeStudyScreenController({required this.ref}) : super(const HomeStudyScreenState()) {
    _initState();
  }

  final Ref ref;
  final Stopwatch stopwatch = Stopwatch();
  late AppinioSwiperController swiperController;
  final quizItemListName = 'study_item_list';
  final knowQuizItemListName = 'study_know_item_list';
  final unKnowQuizItemListName = 'study_unKnow_item_list';
  final isShowTutorial = 'is_show_tutorial';
  final isFinishView = 'is_finish_view';

  /// プレミアムと無料会員でクイズを取得
  List<Quiz> getQuizList() {
    final isPremium = ref.read(authModelProvider).isPremium;
    final premiumQuizList = ref.read(quizModelProvider).quizList;
    final freeQuizList = premiumQuizList.where((x) => !x.isPremium).toList();
    final quizList = isPremium ? premiumQuizList : freeQuizList;
    return quizList;
  }

  Future _initState() async {
    // resetData();
    setIsLoading(true);
    swiperController = AppinioSwiperController();
    await _initIsShowTutorial();
    await _initIsFinishView();
    await _initQuizItemList();
    await startStopwatch();
    _saveDevice();
    setIsLoading(false);
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
      stopwatch.start(); // アプリが前面に戻ったときにタイマーを再開
    } else if (state == AppLifecycleState.paused) {
      stopwatch.stop(); // アプリが背景に移動したときにタイマーを停止
    }
  }

  ///QuizItem更新
  Future _initQuizItemList() async {
    final quizList = getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    if (quizItemList.isEmpty) {
      return;
    }

    // 保存したクイズを取得
    final prefs = await SharedPreferences.getInstance();
    final quizItemListData = prefs.getStringList(quizItemListName);
    final knowQuizItemListData = prefs.getStringList(knowQuizItemListName);
    final unKnowQuizItemListData = prefs.getStringList(unKnowQuizItemListName);
    final List<QuizItem> updatedQuizItemList = [];
    final List<QuizItem> updatedKnowQuizItemList = [];
    final List<QuizItem> updatedUnKnowQuizItemList = [];

    // 知っているクイズリストの更新
    if (knowQuizItemListData != null && knowQuizItemListData.isNotEmpty) {
      final localKnowQuizItemList =
          knowQuizItemListData.map((e) => QuizItem.fromJson(json.decode(e))).toList();
      for (var localQuizItem in localKnowQuizItemList) {
        final matchedQuizItem = quizItemList.firstWhere((x) => x.quizId == localQuizItem.quizId);
        final updatedQuizItem = localQuizItem.copyWith(
          word: matchedQuizItem.word,
          comment: matchedQuizItem.comment,
          question: matchedQuizItem.question,
          ans: matchedQuizItem.ans,
          choices: matchedQuizItem.choices,
          source: matchedQuizItem.source,
          isPremium: matchedQuizItem.isPremium,
          importance: matchedQuizItem.importance,
        );
        updatedKnowQuizItemList.add(updatedQuizItem);
      }
    }

    // 知らないクイズリストの更新
    if (unKnowQuizItemListData != null && unKnowQuizItemListData.isNotEmpty) {
      final localUnKnowQuizItemList =
          unKnowQuizItemListData.map((e) => QuizItem.fromJson(json.decode(e))).toList();
      for (var localQuizItem in localUnKnowQuizItemList) {
        final matchedQuizItem = quizItemList.firstWhere((x) => x.quizId == localQuizItem.quizId);
        final updatedQuizItem = localQuizItem.copyWith(
          word: matchedQuizItem.word,
          comment: matchedQuizItem.comment,
          question: matchedQuizItem.question,
          ans: matchedQuizItem.ans,
          choices: matchedQuizItem.choices,
          source: matchedQuizItem.source,
          isPremium: matchedQuizItem.isPremium,
          importance: matchedQuizItem.importance,
        );
        updatedUnKnowQuizItemList.add(updatedQuizItem);
      }
    }

    // クイズリストの更新
    if (quizItemListData != null) {
      final localQuizItemList =
          quizItemListData.map((e) => QuizItem.fromJson(json.decode(e))).toList();
      for (var localQuizItem in localQuizItemList) {
        final matchedQuizItem = quizItemList.firstWhere((x) => x.quizId == localQuizItem.quizId);
        // 知っている・知らないのリストに含まれていない場合に追加
        if (!updatedKnowQuizItemList.any((x) => x.quizId == localQuizItem.quizId) &&
            !updatedUnKnowQuizItemList.any((x) => x.quizId == localQuizItem.quizId)) {
          final updatedQuizItem = localQuizItem.copyWith(
            word: matchedQuizItem.word,
            comment: matchedQuizItem.comment,
            question: matchedQuizItem.question,
            ans: matchedQuizItem.ans,
            choices: matchedQuizItem.choices,
            source: matchedQuizItem.source,
            isPremium: matchedQuizItem.isPremium,
            importance: matchedQuizItem.importance,
          );
          updatedQuizItemList.add(updatedQuizItem);
        }
      }
    } else {
      updatedQuizItemList.addAll(quizItemList);
    }

    state = state.copyWith(
      quizItemList: updatedQuizItemList,
      knowQuizItemList: updatedKnowQuizItemList,
      unKnowQuizItemList: updatedUnKnowQuizItemList,
    );
  }

  ///チュートリアルカード表示
  Future _initIsShowTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    final isShowTutorialData = prefs.getBool(isShowTutorial);
    if (isShowTutorialData != null) {
      state = state.copyWith(isShowTutorial: isShowTutorialData);
    }
  }

  ///完了画面表示
  Future _initIsFinishView() async {
    final prefs = await SharedPreferences.getInstance();
    final isFinishViewData = prefs.getBool(isFinishView);
    if (isFinishViewData != null) {
      state = state.copyWith(isFinishView: isFinishViewData);
      print({'_initIsFinishView', state.isFinishView});
    }
  }

  ///学習時間計測
  Future startStopwatch() async {
    if (!state.isFinishView && !state.isResultView) {
      WidgetsBinding.instance.addObserver(this);
      stopwatch.start(); //学習時間記録
    }
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
    //クイズが完了したが、「知らない」がまだ含まれる場合
    if (itemIndex == quizItemList.length - 1) {
      setIsFinishView(true);
      setIsResultView(true);
      _updateQuizItem(quizItemList[itemIndex]);
      _saveDevice();
      quizItemList.clear();
      stopwatch.stop();
      state = state.copyWith(quizItemList: quizItemList, duration: stopwatch.elapsed);
      updateHistoryQuiz();
    }
    //まだ問題が続けられる時
    else {
      state = state.copyWith(
        itemIndex: itemIndex + 1,
        quizItemList: quizItemList,
      );
      _updateQuizItem(quizItemList[itemIndex]);
      _saveDevice();
    }
  }

  void restartStudyQuiz() {
    final quizItemList = [...state.quizItemList];
    quizItemList.clear();
    quizItemList.addAll([...state.knowQuizItemList, ...state.unKnowQuizItemList]
      ..sort((a, b) => a.quizId.compareTo(b.quizId)));
    state = state.copyWith(
      quizItemList: quizItemList,
      knowQuizItemList: [],
      unKnowQuizItemList: [],
      itemIndex: 0,
    );
    setIsResultView(false);
    setIsFinishView(false);
    startStopwatch();
    _saveDevice();
  }

  ///苦手ボタンをタップした時
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
    print(index);
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

  ///クイズ結果更新
  void _updateQuizItem(QuizItem quizItem) {
    ref.read(quizModelProvider.notifier).updateQuizItem(quizItem);
  }

  ///クイズ結果更新(端末保存)
  void updateHistoryQuiz() {
    final quizItemList = [
      ...state.quizItemList,
      ...state.knowQuizItemList,
      ...state.unKnowQuizItemList
    ]..sort((a, b) => a.quizId.compareTo(b.quizId));
    final duration = state.duration;
    final studyType = ref.read(quizModelProvider).studyType;
    final updateQuiz = initStudyQuiz.copyWith(
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
    print({'updateStudyQuizItemList', quizItemList});
    _saveDevice();
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  ///チュートリアル切り替え
  Future setIsShowTutorial(bool value) async {
    state = state.copyWith(isShowTutorial: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isShowTutorial, value);
  }

  ///正解画面に切り替え
  Future setIsAnsView(bool value) async {
    state = state.copyWith(isAnsView: value);
  }

  ///リザルト画面に切り替え
  Future setIsResultView(bool value) async {
    state = state.copyWith(isResultView: value);
  }

  ///完了画面に切り替え
  Future setIsFinishView(bool value) async {
    state = state.copyWith(isFinishView: value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFinishView, value);
  }

  Future setDirection(AppinioSwiperDirection? direction) async {
    state = state.copyWith(direction: direction);
  }

  /// 端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final quizItemListData = state.quizItemList.map((e) => json.encode(e.toJson())).toList();
    final knowQuizItemList = state.knowQuizItemList.map((e) => json.encode(e.toJson())).toList();
    final unKnowQuizItemList =
        state.unKnowQuizItemList.map((e) => json.encode(e.toJson())).toList();

    await prefs.setStringList(quizItemListName, quizItemListData);
    await prefs.setStringList(knowQuizItemListName, knowQuizItemList);
    await prefs.setStringList(unKnowQuizItemListName, unKnowQuizItemList);
  }

  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(quizItemListName);
    prefs.remove(knowQuizItemListName);
    prefs.remove(unKnowQuizItemListName);
    prefs.remove(isShowTutorial);
  }
}
