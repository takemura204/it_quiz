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

  void clearSearchText() {
    searchController.clear();
    state = state.copyWith(
        searchText: searchController.text,
        isNotTextEmpty: searchController.text.isNotEmpty);
  }

  // 入力決定後の処理は特定の要件によって変わる可能性があります
  void onSearchConfirmed(String text) {
    // 具体的な処理をここに追加
  }
}
