import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/quiz/quiz_item_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz_state.dart';

// final quizItemProvider =
//     StateNotifierProvider<QuizItemController, List<QuizItemState>>(
//         (ref) => QuizItemController(ref),
//         dependencies: [homeStudyScreenProvider]);
final quizItemProvider =
    StateNotifierProvider<QuizItemController, List<QuizItemState>>(
  (ref) => QuizItemController(ref),
);

class QuizItemController extends StateNotifier<List<QuizItemState>>
    with LocatorMixin {
  QuizItemController(this.ref) : super(_initialValue()) {
    initState();
  }
  final Ref ref;
  int selectedIndex = 0; // 追加する

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  static List<QuizItemState> _initialValue() {
    // groupListsByを使用してリストをグループ化
    final groupMap = quizItems.groupListsBy((x) => x.group);

    // グループごとにリストをidでソート
    for (final group in groupMap.keys) {
      groupMap[group]!.sort((a, b) => a.id.compareTo(b.id));
    }
    // グループの順にリストを並べ替え
    final sortedGroups = groupMap.keys.toList()..sort((a, b) => a.compareTo(b));
    // グループごとのリストを結合して結果のリストを作成
    final result = <QuizItemState>[];
    for (final group in sortedGroups) {
      result.addAll(groupMap[group]!);
    }
    // ここで初期値を設定
    return result;
  }

  /// 端末に保存されているデータを読み込む
  Future _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('quiz_items');
    if (data != null) {
      state = data.map((e) => QuizItemState.fromJson(json.decode(e))).toList();
    }
  }

  /// 現在のインデックスを取得し、更新
  void tapQuizItemBar(int index) {
    selectedIndex = index;
  }

  ///値を更新し、端末に保存する
  void updateItem(List<QuizState> quizList) {
    final score = quizList.where((x) => x.isJudge == true).toList().length;
    final isCompleted = quizList.length == score;
    state = state.map((item) {
      if (item.title == state[selectedIndex].title) {
        return state[selectedIndex].copyWith(
            isCompleted: isCompleted, score: score, quizList: quizList);
      }
      return item;
    }).toList();

    _saveData();
  }

  /// 現在のstateを端末に保存する
  Future _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = state.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('quiz_items', data);
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = state.map((e) => json.encode(e.toJson())).toList();
    prefs.remove("quiz_items");
    await prefs.setStringList('quiz_items', data);
  }
}
