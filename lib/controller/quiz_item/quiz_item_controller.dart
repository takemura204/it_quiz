import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_analytics/dashboard_analytics_controller.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/model/quiz_item/study_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz_state.dart';
import '../home_review/home_review_screen_controller.dart';

final quizItemProvider =
    StateNotifierProvider<QuizItemController, List<QuizItemState>>(
  (ref) => QuizItemController(ref),
);

class QuizItemController extends StateNotifier<List<QuizItemState>>
    with LocatorMixin {
  QuizItemController(this.ref) : super([]) {
    initState();
  }
  final Ref ref;
  int selectedIndex = 0;
  QuizType quizType = QuizType.study;

  @override
  void initState() {
    // _resetData();
    _loadQuizData();
    super.initState();
  }

  List<QuizItemState> _initialValue() {
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
  Future _loadQuizData() async {
    final prefs = await SharedPreferences.getInstance();
    final quizItemDataJson = prefs.getStringList('quiz_items');
    if (quizItemDataJson != null && quizItemDataJson.isNotEmpty) {
      state = quizItemDataJson
          .map((e) => QuizItemState.fromJson(json.decode(e)))
          .toList();

      // stateの各要素に対して、quizStudyItemsの更新を適用
      state = state.map((item) {
        // quizStudyItemsから、対応するアイテムを探す
        final updatedItem =
            quizStudyItems.firstWhereOrNull((e) => e.id == item.id);
        // 対応するアイテムが見つかった場合
        if (updatedItem != null) {
          // 各クイズに対して、questionの更新を適用
          return item.copyWith(
            quizList: item.quizList.map((quiz) {
              // updatedItemのクイズリストから、対応するクイズを探す
              final updatedQuiz = updatedItem.quizList
                  .firstWhereOrNull((e) => e.quizId == quiz.quizId);

              // 対応するクイズが見つかった場合
              if (updatedQuiz != null) {
                // questionだけを更新
                return quiz.copyWith(
                  question: updatedQuiz.question,
                  ans: updatedQuiz.ans,
                  choices: updatedQuiz.choices,
                  comment: updatedQuiz.comment,
                );
              }
              // 対応するクイズが見つからなかった場合、変更なし
              return quiz;
            }).toList(),
          );
        }
        return item;
      }).toList();
    } else {
      print("null or empty list");
      state = _initialValue();
    }
    _saveData();
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
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quizList);
        break;

      ///Dailyクイズ更新
      case QuizType.daily:
        ref.read(homeReviewScreenProvider.notifier).updateDailyItem(quizList);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quizList);
        break;

      ///　Reviewクイズ更新
      case QuizType.review:
        _updateWeakItems(quizList);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quizList);
        break;

      ///Testクイズ更新
      case QuizType.test:
        ref.read(homeReviewScreenProvider.notifier).updateTestItem(quizList);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quizList);
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
          isCompleted: isCompleted,
          score: score,
          quizList: quizList,
          timeStamp: DateTime.now(),
        );
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
