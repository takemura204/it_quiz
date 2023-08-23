import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

  void setSearchText(String text) {
    state = state.copyWith(searchText: text, isNotTextEmpty: text.isNotEmpty);
  }

  void setSearchKeywords(String text) {
    final keywords = splitBySpace(normalizeText(text));
    state = state.copyWith(
        searchKeywords: keywords,
        searchText: text,
        isNotTextEmpty: text.isNotEmpty);
  }

  void clearSearchText() {
    searchController.clear();
    state = state.copyWith(
        searchText: searchController.text,
        isNotTextEmpty: searchController.text.isNotEmpty);
  }

  void onSearchConfirmed(String text) {}

  String normalizeText(String input) {
    // ひらがな、カタカナ、漢字、半角全角の数字や英語を正規化する処理を書く
    // この例では簡単に全角を半角に変換する処理のみを示す
    // 実際の処理はもう少し複雑になる可能性がある
    return input.replaceAll('　', ' '); // 全角スペースを半角スペースに変換
  }

  List<String> splitBySpace(String input) {
    return input.split(' '); // 半角スペースで文字列を分割
  }
}
