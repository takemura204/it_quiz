import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_search_screen_state.dart';

final homeSearchScreenProvider =
    StateNotifierProvider<HomeSearchScreenController, HomeSearchScreenState>(
  (ref) => HomeSearchScreenController(ref: ref),
);

class HomeSearchScreenController extends StateNotifier<HomeSearchScreenState>
    with LocatorMixin {
  HomeSearchScreenController({required this.ref})
      : super(HomeSearchScreenState());

  final Ref ref;
  final searchController = TextEditingController();

  ///onChanged
  void setSearchText(String text) {
    state = state.copyWith(searchText: text, isNotTextEmpty: text.isNotEmpty);
  }

  ///onFieldSubmitted
  void setSearchKeywords(String text) {
    final normalizedTexts = _normalizeText(text);
    final Set<String> allKeywordsSet = {};

    for (var normalizedText in normalizedTexts) {
      allKeywordsSet.addAll(_splitBySpace(normalizedText));
    }

    final List<String> allKeywords = allKeywordsSet.toList();
    final matchedKeywords = _matchedKeywords(allKeywords);

    state = state.copyWith(
      searchKeywords: matchedKeywords,
      searchText: text,
      isNotTextEmpty: text.isNotEmpty,
    );
  }

  ///onClear
  void clearSearchText() {
    searchController.clear();
    state = state.copyWith(
        searchText: searchController.text,
        isNotTextEmpty: searchController.text.isNotEmpty);
  }

  ///ヒットしたTextのみ抽出
  List<String> _matchedKeywords(List<String> keywords) {
    final quizList = ref.watch(quizModelProvider).quizList;
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

    // 2. 全角の英数字を半角に変換
    processed = processed.replaceAllMapped(RegExp(r'[０-９ａ-ｚＡ-Ｚ]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code - 0xFEE0);
    });

    normalizedTexts.add(processed);

    // 3. 半角の英数字を全角に変換
    final String toFullWidth =
        processed.replaceAllMapped(RegExp(r'[0-9a-zA-Z]'), (match) {
      final code = match.group(0)!.codeUnitAt(0);
      return String.fromCharCode(code + 0xFEE0);
    });

    normalizedTexts.add(toFullWidth);

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

    String toCommonHiragana = processed;
    kanjiToHiragana.forEach((kanji, hiragana) {
      toCommonHiragana = toCommonHiragana.replaceAll(kanji, hiragana);
    });

    normalizedTexts.add(toCommonHiragana);

    return normalizedTexts;
  }
}
