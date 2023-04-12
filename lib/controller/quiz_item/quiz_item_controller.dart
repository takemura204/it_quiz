import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/quiz/quiz_item_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

final quizItemProvider =
    StateNotifierProvider<QuizItemController, List<QuizItemState>>(
  (ref) => QuizItemController(),
);

class QuizItemController extends StateNotifier<List<QuizItemState>>
    with LocatorMixin {
  QuizItemController() : super(quizItems) {
    initState();
  }
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  /// 端末に保存されているデータを読み込む
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('quiz_items');
    if (data != null) {
      state = data.map((e) => QuizItemState.fromJson(json.decode(e))).toList();
    }
  }

  ///値を更新し、端末に保存する
  void updateItem(int index, bool isCompleted) {
    state = state.map((item) {
      if (item.id == index) {
        return item.copyWith(isCompleted: isCompleted);
      }
      return item;
    }).toList();
    _saveData();
  }

  /// 現在のstateを端末に保存する
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = state.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('quiz_items', data);
  }
}
