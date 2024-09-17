import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_search_modal/home_search_modal_controller.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';

import '../../model/quiz_item/quiz_item.dart';
import 'home_search_screen_state.dart';

final homeSearchScreenProvider =
    StateNotifierProvider<HomeSearchScreenController, HomeSearchScreenState>(
        (ref) => HomeSearchScreenController(ref: ref));

class HomeSearchScreenController extends StateNotifier<HomeSearchScreenState> {
  HomeSearchScreenController({required this.ref}) : super(HomeSearchScreenState()) {
    _initState();
  }

  final Ref ref;
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  Future _initState() async {
    setIsLoading(true);
    await _initFilterQuiz();
    setIsLoading(false);
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future _initFilterQuiz() async {
    final quizItemList =
        ref.read(quizModelProvider).quizList.expand((x) => x.quizItemList).toList();
    updateFilteredQuizItemList(quizItemList);
  }

  void updateFilteredQuizItemList(List<QuizItem> quizItemList) {
    state = state.copyWith(searchQuizItemList: quizItemList);
  }

  void tapIsSavedFilterButton() {
    state = state.copyWith(isSavedFilter: !state.isSavedFilter);
    final isSavedFilter = state.isSavedFilter;

    if (isSavedFilter) {
      final isPremium = ref.read(authModelProvider).isPremium;
      if (isPremium) {
        final quizItemList =
            ref.read(quizModelProvider).quizList.expand((x) => x.quizItemList).toList();
        final filteredQuizItemList = quizItemList.where((x) => x.isSaved).toList();
        updateFilteredQuizItemList(filteredQuizItemList);
      } else {
        final quizItemList = ref
            .read(quizModelProvider)
            .quizList
            .where((x) => !x.isPremium)
            .expand((x) => x.quizItemList)
            .toList();
        final filteredQuizItemList = quizItemList.where((x) => x.isSaved).toList();
        updateFilteredQuizItemList(filteredQuizItemList);
      }
    } else {
      setSearchKeywords(state.searchText);
    }
  }

  ///onChanged
  void setSearchText(String text) {
    state = state.copyWith(searchText: text, isNotTextEmpty: text.isNotEmpty);
  }

  ///検索結果
  Future setSearchKeywords(String text) async {
    final quizItemList =
        ref.read(quizModelProvider).quizList.expand((x) => x.quizItemList).toList();
    final filterQuizItemList =
        ref.read(homeSearchModalProvider).filterQuizList.expand((x) => x.quizItemList).toList();
    if (text.isEmpty) {
      state = state.copyWith(
        searchText: '',
        searchKeywords: [],
        isNotTextEmpty: false,
        isSavedFilter: false,
      );
      updateFilteredQuizItemList(filterQuizItemList);
      return;
    } else {
      final normalizedTexts = _normalizeText(text);
      final Set<String> allKeywordsSet = {};
      for (var normalizedText in normalizedTexts) {
        allKeywordsSet.addAll(_splitBySpace(normalizedText));
      }

      final allKeywords = allKeywordsSet.toList();
      final matchedKeywords = _matchedKeywords(allKeywords);
      final searchKeywords = matchedKeywords.isNotEmpty ? matchedKeywords : allKeywords;
      final searchQuizItemList = searchKeywords.isEmpty
          ? quizItemList
          : filterQuizItemList.where((item) {
              return searchKeywords.any((keyword) {
                return item.comment.contains(keyword);
              });
            }).toList();
      state = state.copyWith(
        isSavedFilter: false,
        searchKeywords: searchKeywords,
        searchText: text,
        isNotTextEmpty: text.isNotEmpty,
        searchQuizItemList: searchQuizItemList,
      );
    }
  }

  ///onClear
  void clearSearchText() {
    textEditingController.clear();
    state = state.copyWith(
        searchText: textEditingController.text,
        isNotTextEmpty: textEditingController.text.isNotEmpty);
  }

  ///ヒットしたTextのみ抽出
  List<String> _matchedKeywords(List<String> keywords) {
    final quizList = ref.read(quizModelProvider).quizList;
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();

    final matchedKeywords = <String>{};

    for (var keyword in keywords) {
      for (var item in quizItemList) {
        if (item.question.contains(keyword)) {
          matchedKeywords.add(keyword);
          break;
        }
      }
    }

    return matchedKeywords.toList();
  }

  ///スペース変換
  List<String> _splitBySpace(String input) {
    return input
        .split(' ') // 半角スペースで文字列を分割
        .where((e) => e.isNotEmpty) // 空の要素を削除
        .toList();
  }

  ///文字を変換
  List<String> _normalizeText(String input) {
    final List<String> normalizedTexts = [];
    String processed = input;

    // 1. 全角スペースを半角スペースに変換
    processed = processed.replaceAll('　', ' ');

    // // 2. 大文字を小文字に変換
    // final String toLowercase = processed.toLowerCase();
    // normalizedTexts.add(toLowercase);
    //
    // // 3. 小文字を大文字に変換
    // final String toUppercase = processed.toUpperCase();
    // normalizedTexts.add(toUppercase);

    // 4. カタカナをひらがなに変換
    final String toHiragana = processed.replaceAllMapped(RegExp(r'[\u30A1-\u30F6]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code - 0x60);
    });

    normalizedTexts.add(toHiragana);

    // 5. ひらがなをカタカナに変換
    final String toKatakana = processed.replaceAllMapped(RegExp(r'[\u3041-\u3096]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code + 0x60);
    });

    normalizedTexts.add(toKatakana);

    // 6. 漢字の変換は以下のように行います。
    final kanjiToHiragana = {
      '一': 'いち',
      '二': 'に',
      '三': 'さん',
    };

    String _toCommonHiragana = processed;
    kanjiToHiragana.forEach((kanji, hiragana) {
      _toCommonHiragana = _toCommonHiragana.replaceAll(kanji, hiragana);
    });

    normalizedTexts.add(_toCommonHiragana);

    return normalizedTexts;
  }

  void tapSaveButton(int index) {
    final quizItemList = [...state.searchQuizItemList];
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
    state = state.copyWith(searchQuizItemList: quizItemList);
    ref.read(quizModelProvider.notifier).updateQuizItem(quizItemList[index]);
  }

  void tapWeakButton(int index) {
    final quizItemList = [...state.searchQuizItemList];
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
    state = state.copyWith(searchQuizItemList: quizItemList);

    ref.read(quizModelProvider.notifier).updateQuizItem(quizItemList[index]);
  }

  Future _scrollListener() async {
    if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
      if (state.maxItemsToDisplay < state.searchQuizItemList.length && !state.isScrollLoading) {
        state = state.copyWith(isScrollLoading: true);
        await Future.delayed(const Duration(milliseconds: 100));
        state =
            state.copyWith(maxItemsToDisplay: state.maxItemsToDisplay + 100, isScrollLoading: true);
        state = state.copyWith(isScrollLoading: false);
      }
    }
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
