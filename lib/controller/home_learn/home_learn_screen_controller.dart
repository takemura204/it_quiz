import 'package:appinio_swiper/controllers.dart';
import 'package:appinio_swiper/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  HomeLearnScreenController({required this.ref})
      : super(const HomeLearnScreenState()) {
    _initState();
  }

  final Ref ref;
  late AppinioSwiperController swiperController;

  Future _initState() async {
    setIsLoading(true);
    swiperController = AppinioSwiperController();
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          _initQuizItemList(),
        ]);
      }
      setIsLoading(false);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    swiperController.dispose();
    super.dispose();
  }

  Future _initQuizItemList() async {
    final isPremium = ref.read(authModelProvider).isPremium;
    final List<QuizItem> quizItemList = [];
    if (isPremium) {
      final allQuizItemList = ref
          .read(quizModelProvider)
          .quizList
          .expand((x) => x.quizItemList)
          .toList();
      quizItemList.addAll(allQuizItemList);
    } else {
      final freeQuizItemList = ref
          .read(quizModelProvider)
          .quizList
          .expand((x) => x.quizItemList)
          .where((x) => !x.isPremium)
          .toList();
      quizItemList.addAll(freeQuizItemList);
    }

    state = state.copyWith(quizItemList: quizItemList);
  }

  ///「知っている・知らない」ボタンを押した時
  Future tapActionButton(bool isKnow) async {
    await setIsAnsView(false);
    await setDirection(null);
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final index = state.itemIndex;
    final quizId = quizItemList[index].quizId;

    // QuizItemを更新
    quizItemList[index] = QuizItem(
      quizId: quizItemList[index].quizId,
      word: quizItemList[index].word,
      comment: quizItemList[index].comment,
      question: quizItemList[index].question,
      choices: quizItemList[index].choices,
      ans: quizItemList[index].ans,
      isWeak: quizItemList[index].isWeak,
      status: isKnow && quizItemList[index].status == QuizStatusType.unlearned
          ? QuizStatusType.learned
          : quizItemList[index].status,
      importance: quizItemList[index].importance,
      isSaved: quizItemList[index].isSaved,
      lapIndex: lapIndex,
      source: quizItemList[index].source,
      isPremium: quizItemList[index].isPremium,
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
      knowQuizItemList.add(quizItemList[index]);
    } else {
      //knowQuizItemListに含まれている時
      if (isAlreadyKnown) {
        knowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      //unKnowQuizItemListに含まれていない時
      if (isAlreadyUnknown) {
        unKnowQuizItemList.removeWhere((item) => item.quizId == quizId);
      }
      unKnowQuizItemList.add(quizItemList[index]);
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
    final index = state.itemIndex;
    final lapIndex = state.lapIndex;
    final quizItemList = [...state.quizItemList];
    final knowQuizList = [...state.knowQuizItemList];
    final unKnowQuizList = [...state.unKnowQuizItemList];
    //問題が終わったが,「知ってる」リストに全て含まれていない場合
    if (index == quizItemList.length - 1 &&
        knowQuizList.length != state.quizItemList.length) {
      quizItemList.clear();
      quizItemList.addAll(unKnowQuizList);
      state = state.copyWith(
          itemIndex: 0, lapIndex: lapIndex + 1, quizItemList: quizItemList);
    }
    //問題が終わり,「知ってる」リストに全て含まれている場合
    else if (state.knowQuizItemList.length == state.quizItemList.length) {
      final isPremium = ref.read(authModelProvider).isPremium;
      quizItemList.clear(); // クイズアイテムリストをクリア
      // 知ってるリストと知らないリストを結合して、quizIdの昇順に並べ替え
      quizItemList.addAll([...knowQuizList, ...unKnowQuizList]
        ..sort((a, b) => a.quizId.compareTo(b.quizId)));

      state = state.copyWith(
        itemIndex: 0,
        lapIndex: lapIndex + 1,
        quizItemList: quizItemList,
      );

      _updateQuiz(quizItemList[index]);
    }
    //まだ問題が続蹴られる時
    else {
      state = state.copyWith(itemIndex: index + 1);
    }
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

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
