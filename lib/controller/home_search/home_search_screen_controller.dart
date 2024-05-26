import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';

import '../../model/quiz/quizzes.dart';
import '../../model/quiz_item/quiz_item.dart';
import 'home_search_screen_state.dart';

final homeSearchScreenProvider =
    StateNotifierProvider<HomeSearchScreenController, HomeSearchScreenState>(
  (ref) => HomeSearchScreenController(ref: ref),
  dependencies: [quizModelProvider],
);

class HomeSearchScreenController extends StateNotifier<HomeSearchScreenState> {
  HomeSearchScreenController({required this.ref})
      : super(HomeSearchScreenState()) {
    _initState();
  }

  final Ref ref;
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  Future _initState() async {
    setIsLoading(true);
    ref.listen<Quizzes>(quizModelProvider, (_, quizzes) async {
      if (quizzes.isLoading) {
        await Future.wait([
          _initFilterQuiz(),
        ]);
        setIsLoading(false);
      }
    });
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future _initFilterQuiz() async {
    ///プレミアム枠の単語をロックできない。
    final quizItemList = ref
        .read(quizModelProvider)
        .quizList
        .expand((x) => x.quizItemList)
        .toList();
    setFilterQuiz(quizItemList);
  }

  Future _scrollListener() async {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      if (state.maxItemsToDisplay < state.filteredQuizItemList.length &&
          !state.isScrollLoading) {
        state = state.copyWith(isScrollLoading: true);
        await Future.delayed(const Duration(milliseconds: 100));
        setMaxItemsToDisplay();
        state = state.copyWith(isScrollLoading: false);
      }
    }
  }

  void setMaxItemsToDisplay() {
    if (state.maxItemsToDisplay < state.filteredQuizItemList.length) {
      state = state.copyWith(
        maxItemsToDisplay: state.maxItemsToDisplay + 50,
        isScrollLoading: true,
      );
    }
  }

  void setFilterQuiz(List<QuizItem> quiz) {
    state = state.copyWith(filteredQuizItemList: quiz);
  }

  void tapIsSavedFilterButton() {
    state = state.copyWith(isSavedFilter: !state.isSavedFilter);
    final isSavedFilter = state.isSavedFilter;

    if (isSavedFilter) {
      final isPremium = ref.read(authModelProvider).isPremium;
      if (isPremium) {
        final quizItemList = ref
            .read(quizModelProvider)
            .quizList
            .expand((x) => x.quizItemList)
            .toList();
        final filteredQuizItemList =
            quizItemList.where((x) => x.isSaved).toList();
        setFilterQuiz(filteredQuizItemList);
      } else {
        final quizItemList = ref
            .read(quizModelProvider)
            .quizList
            .where((x) => !x.isPremium)
            .expand((x) => x.quizItemList)
            .toList();
        final filteredQuizItemList =
            quizItemList.where((x) => x.isSaved).toList();
        setFilterQuiz(filteredQuizItemList);
      }
    } else {
      setSearchKeywords(state.searchText);
    }
  }

  void tapSavedButton(QuizItem quizItem) {
    // quizItemの答えに基づいて一致するすべてのアイテムを更新
    final updatedQuizItems = state.filteredQuizItemList.map((item) {
      if (item.ans == quizItem.ans) {
        // isSavedを反転させる
        return item.copyWith(isSaved: !item.isSaved);
      }
      return item; // 一致しない場合は元のアイテムをそのまま返す
    }).toList();

    // 更新したリストで状態を更新
    state = state.copyWith(filteredQuizItemList: updatedQuizItems);

    // すべての変更されたアイテムに対して更新処理を呼び出す
    updatedQuizItems
        .where((item) => item.ans == quizItem.ans)
        .forEach((updatedItem) {
      ref.read(quizModelProvider.notifier).updateSavedQuiz(updatedItem);
    });
  }

  ///onChanged
  void setSearchText(String text) {
    state = state.copyWith(searchText: text, isNotTextEmpty: text.isNotEmpty);
  }

  ///onFieldSubmitted
  Future setSearchKeywords(String text) async {
    final normalizedTexts = _normalizeText(text);
    if (text.isEmpty) {
      state = state.copyWith(
        searchText: '',
        searchKeywords: [],
        isNotTextEmpty: false,
        isSavedFilter: false,
      );
      await _initFilterQuiz();
      return;
    }
    final Set<String> allKeywordsSet = {};

    for (var normalizedText in normalizedTexts) {
      allKeywordsSet.addAll(_splitBySpace(normalizedText));
    }

    final allKeywords = allKeywordsSet.toList();
    final matchedKeywords = _matchedKeywords(allKeywords);
    final searchKeywords =
        matchedKeywords.isNotEmpty ? matchedKeywords : allKeywords;

    final quizList = ref.read(quizModelProvider).quizList;
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filteredQuizItemList = searchKeywords.isEmpty
        ? quizItemList
        : quizItemList.where((item) {
            return searchKeywords.any((keyword) {
              return item.comment.contains(keyword);
            });
          }).toList();
    state = state.copyWith(
      isSavedFilter: false,
      searchKeywords: searchKeywords,
      searchText: text,
      isNotTextEmpty: text.isNotEmpty,
      filteredQuizItemList: filteredQuizItemList,
    );
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
    final String toHiragana =
        processed.replaceAllMapped(RegExp(r'[\u30A1-\u30F6]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code - 0x60);
    });

    normalizedTexts.add(toHiragana);

    // 5. ひらがなをカタカナに変換
    final String toKatakana =
        processed.replaceAllMapped(RegExp(r'[\u3041-\u3096]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code + 0x60);
    });

    normalizedTexts.add(toKatakana);

    // 6. 漢字の変換は以下のように行います。
    final kanjiToHiragana = {
      '一': 'いち',
      '二': 'に',
      '三': 'さん',
      // 他の漢字とひらがなの対応を追加
    };

    String _toCommonHiragana = processed;
    kanjiToHiragana.forEach((kanji, hiragana) {
      _toCommonHiragana = _toCommonHiragana.replaceAll(kanji, hiragana);
    });

    normalizedTexts.add(_toCommonHiragana);

    return normalizedTexts;
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }
}
