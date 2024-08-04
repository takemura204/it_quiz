import 'dart:convert';

import 'package:appinio_swiper/controllers.dart';
import 'package:appinio_swiper/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import 'home_learn_screen_state.dart';

final homeLearnScreenProvider =
    StateNotifierProvider<HomeLearnScreenController, HomeLearnScreenState>(
  (ref) => HomeLearnScreenController(ref: ref),
  dependencies: [quizModelProvider],
);

class HomeLearnScreenController extends StateNotifier<HomeLearnScreenState>
    with LocatorMixin, WidgetsBindingObserver {
  HomeLearnScreenController({required this.ref}) : super(const HomeLearnScreenState()) {
    _initState();
  }

  final Ref ref;
  late AppinioSwiperController swiperController;
  final quizItemListName = 'home_learn_item_list';
  final knowQuizItemListName = 'home_learn_know_item_list';
  final unKnowQuizItemListName = 'home_learn_unKnow_item_list';

  Future _initState() async {
    setIsLoading(true);
    swiperController = AppinioSwiperController();
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          // resetData(),
          _initQuizItemList(),
        ]);
      }
      _saveDevice();
      setIsLoading(false);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    swiperController.dispose();
    super.dispose();
  }

  ///QuizItem更新
  Future _initQuizItemList() async {
    // プレミアムと無料会員でクイズを取得
    final isPremium = ref.read(authModelProvider).isPremium;
    final premiumQuizItemList =
        ref.read(quizModelProvider).quizList.expand((x) => x.quizItemList).toList();
    final freeQuizItemList = ref
        .read(quizModelProvider)
        .quizList
        .expand((x) => x.quizItemList)
        .where((x) => !x.isPremium)
        .toList();
    final List<QuizItem> quizItemList = isPremium ? premiumQuizItemList : freeQuizItemList;

    // ローカルで保存したクイズを取得
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
    if (quizItemListData != null && quizItemListData.isNotEmpty) {
      final localQuizItemList =
          quizItemListData.map((e) => QuizItem.fromJson(json.decode(e))).toList();
      for (var localQuizItem in localQuizItemList) {
        final matchedQuizItem = quizItemList.firstWhere((x) => x.quizId == localQuizItem.quizId);
        // 既知・未知のリストに含まれていない場合に追加
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

      state = state.copyWith(
        quizItemList: updatedQuizItemList,
        knowQuizItemList: updatedKnowQuizItemList,
        unKnowQuizItemList: updatedUnKnowQuizItemList,
      );
    }
    // 初回起動時の設定
    else {
      state = state.copyWith(quizItemList: quizItemList);
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
      status: isKnow && quizItemList[itemIndex].status == QuizStatusType.unlearned
          ? QuizStatusType.learned
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
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final knowQuizList = [...state.knowQuizItemList];
    final unKnowQuizList = [...state.unKnowQuizItemList];
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (itemIndex == quizItemList.length - 1 && knowQuizList.length != state.quizItemList.length) {
      quizItemList.clear();
      quizItemList.addAll(unKnowQuizList);
      state = state.copyWith(itemIndex: 0, lapIndex: lapIndex + 1, quizItemList: quizItemList);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowQuizItemList.length == state.quizItemList.length) {
      quizItemList.clear(); // クイズアイテムリストをクリア
      // 知ってるリストと知らないリストを結合して、quizIdの昇順に並べ替え
      quizItemList.addAll(
          [...knowQuizList, ...unKnowQuizList]..sort((a, b) => a.quizId.compareTo(b.quizId)));

      state = state.copyWith(
        itemIndex: 0,
        lapIndex: lapIndex + 1,
        quizItemList: quizItemList,
      );
    }
    //まだ問題が続けられる時
    else {
      state = state.copyWith(
        itemIndex: itemIndex + 1,
        quizItemList: quizItemList,
      );
    }
    _updateQuiz(quizItemList[itemIndex]);
    _saveDevice();
  }

  ///正解画面に切り替え
  Future setIsAnsView(bool value) async {
    state = state.copyWith(isAnsView: value);
  }

  Future setDirection(AppinioSwiperDirection? direction) async {
    state = state.copyWith(direction: direction);
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
      status: quizItemList[index].status,
      isSaved: !quizItemList[index].isSaved,
      choices: quizItemList[index].choices,
      lapIndex: quizItemList[index].lapIndex,
      isPremium: quizItemList[index].isPremium,
      source: quizItemList[index].source,
      importance: quizItemList[index].importance,
    );
    state = state.copyWith(quizItemList: quizItemList);
    _updateQuiz(quizItemList[index]);
  }

  ///クイズ結果更新(端末保存)
  void _updateQuiz(QuizItem quizItem) {
    ref.read(quizModelProvider.notifier).updateQuizItem(quizItem);
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
    // await prefs.setInt(itemIndexName, itemIndex);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(quizItemListName);
    prefs.remove(knowQuizItemListName);
    prefs.remove(unKnowQuizItemListName);
  }
}
