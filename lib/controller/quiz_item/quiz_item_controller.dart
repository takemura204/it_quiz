import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/quiz_item/study_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../home_review/home_review_screen_controller.dart';
import '../quiz/quiz_state.dart';

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
  int selectedIndex = 0;
  QuizType quizType = QuizType.study;

  @override
  void initState() {
    _resetData();
    _loadData();
    super.initState();
  }

  static List<QuizItemState> _initialValue() {
    // groupListsByを使用してリストをグループ化
    final groupMap = quizStudyItems.groupListsBy((x) => x.group);

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

  void setQuizType(QuizType type) {
    quizType = type;
  }

  ///クイズ更新
  void updateItem(List<QuizState> quizList) {
    switch (quizType) {
      ///　Studyクイズ更新
      case QuizType.study:
        _updateStudyItem(quizList);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem(quizList);
        break;

      ///　Reviewクイズ更新
      case QuizType.review:
        _updateWeakItems(quizList);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem(quizList);
        break;

      ///Dailyクイズ更新
      case QuizType.daily:
        // ref.read(homeReviewScreenProvider.notifier).updateWeakItem(quizList);
        break;

      ///Testクイズ更新
      case QuizType.test:
        // ref.read(homeReviewScreenProvider.notifier).updateWeakItem(quizList);
        break;
    }
  }

  ///Studyクイズ更新・保存
  void _updateStudyItem(List<QuizState> quizList) {
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

  ///Reviewクイズ更新・保存
  void _updateWeakItems(List<QuizState> quizList) {
    // quizListからisWeakがfalseのクイズのリストを抽出
    final nonWeakQuizList = quizList.where((quiz) => !quiz.isWeak).toList();
    // stateの各QuizItemStateのquizListをループして、nonWeakQuizListに含まれる同じquestionを持つクイズがある場合、そのクイズのisWeakをfalseに更新
    state = state.map((item) {
      final updatedQuizList = item.quizList.map((quiz) {
        final updatedQuiz = nonWeakQuizList.firstWhereOrNull(
            (nonWeakQuiz) => nonWeakQuiz.question == quiz.question);
        if (updatedQuiz != null) {
          return quiz.copyWith(isWeak: false);
        }
        return quiz;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return item.copyWith(quizList: updatedQuizList);
    }).toList();

    _saveData();
  }

  // 複数のグループと範囲を選択して、その範囲の問題をランダムに抽出して保存するメソッド
  Future<void> _updateTestItems(List<String> selectedGroups, int range) async {
    // 選択されたグループの問題をフィルタリング
    final filteredQuizItems =
        state.where((item) => selectedGroups.contains(item.group)).toList();

    // 問題をランダムに選択
    final random = Random();
    final selectedQuizList = List.generate(range, (index) {
      return filteredQuizItems[random.nextInt(filteredQuizItems.length)]
          .quizList;
    }).expand((quizList) => quizList).toList();

    // 保存処理を実行
    final prefs = await SharedPreferences.getInstance();
    final data = selectedQuizList.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('selected_quiz_list', data);
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
