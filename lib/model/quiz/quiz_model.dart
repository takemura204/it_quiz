import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_analytics/dashboard_analytics_controller.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:kentei_quiz/model/quiz/quizzes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../controller/home_review/home_review_screen_controller.dart';
import '../lang/initial_resource.dart';
import '../quiz_item/quiz_item.dart';

part 'quiz_resource.dart';
part 'quizzes_resource.dart';

final quizModelProvider = StateNotifierProvider<QuizModel, Quizzes>(
  (ref) => QuizModel(ref),
);

class QuizModel extends StateNotifier<Quizzes> with LocatorMixin {
  QuizModel(this.ref) : super(Quizzes()) {
    initState();
  }
  final Ref ref;
  bool _isSameDay(DateTime? date1, DateTime date2) {
    if (date1 == null) {
      return false;
    }
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Future initState() async {
    // _resetData();
    await _loadQuizData(); // データを読み込む
    super.initState();
  }

  ///読み込み
  Future _loadQuizData() async {
    _getQuizListData();
    _getDailyQuiz();
    _getWeakQuiz();
    // _getTestQuiz();
    // _getRunningDay();
    // _saveData();
  }

  /// クイズデータ取得
  Future _getQuizListData() async {
    final prefs = await SharedPreferences.getInstance();
    final quizListDataJson = prefs.getStringList('quiz_list');
    if (quizListDataJson != null && quizListDataJson.isNotEmpty) {
      final getQuizList =
          quizListDataJson.map((e) => Quiz.fromJson(json.decode(e))).toList();
      final updateQuizList = getQuizList.map((quiz) {
        // studyQuizから、対応するアイテムを探す
        final updatedItem = studyQuiz.firstWhereOrNull((e) => e.id == quiz.id);
        if (updatedItem != null) {
          // 各クイズに対して、questionの更新を適用
          return quiz.copyWith(
            quizItemList: quiz.quizItemList.map((quizItem) {
              // updatedItemのクイズリストから、対応するクイズを探す
              final updatedQuiz = updatedItem.quizItemList
                  .firstWhereOrNull((e) => e.quizId == quizItem.quizId);
              if (updatedQuiz != null) {
                // questionだけを更新
                return quizItem.copyWith(
                  question: updatedQuiz.question,
                  ans: updatedQuiz.ans,
                  choices: updatedQuiz.choices,
                  comment: updatedQuiz.comment,
                );
              }
              // 対応するクイズが見つからなかった場合、変更なし
              return quizItem;
            }).toList(),
          );
        }
        return quiz;
      }).toList();
      state = state.copyWith(quizList: updateQuizList);
    }
    // 初回起動時
    else {
      final initialQuizList = _initialQuizList();
      state = state.copyWith(quizList: initialQuizList);
    }
    _saveDevice();
  }

  /// dailyQuiz追加
  Future _getDailyQuiz() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    final dailyQuizData = prefs.getString('daily_quiz');
    if (dailyQuizData != null) {
      final dailyQuiz = Quiz.fromJson(json.decode(dailyQuizData));
      state = state.copyWith(dailyQuiz: dailyQuiz);
    } else {
      final defaultDailyQuiz = ref.read(quizModelProvider.notifier).dailyQuiz;
      state = state.copyWith(dailyQuiz: defaultDailyQuiz);
    }
    final dailyQuiz = state.dailyQuiz!;
    final timeStamp = dailyQuiz.timeStamp;
    final quizList = [
      ...ref
          .read(quizModelProvider).quizList
          .expand((quizItem) => quizItem.quizItemList)
          .toList()
    ];
    final pickedQuizList = <QuizItem>[];
    final random = Random();

    final saveDate = timeStamp != null
        ? DateTime(timeStamp.year, timeStamp.month, timeStamp.day)
        : null;
    final nowDate = DateTime(now.year, now.month, now.day);

    //初回のみ or 違う日の時更新
    if (timeStamp == null || !_isSameDay(saveDate, nowDate)) {
      for (int i = 0; i < 5; i++) {
        if (quizList.isNotEmpty) {
          final randomIndex = random.nextInt(quizList.length);
          pickedQuizList.add(quizList[randomIndex]);
          quizList.removeAt(randomIndex);
        } else {
          break;
        }
      }
      final updateDailyQuiz = dailyQuiz.copyWith(quizItemList: pickedQuizList);
      state = state.copyWith(dailyQuiz: updateDailyQuiz);
    }
  }

  Future _getWeakQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final weakQuizData = prefs.getString('weak_quiz');
    if (weakQuizData != null) {
      final weakQuiz = Quiz.fromJson(json.decode(weakQuizData));
      state = state.copyWith(weakQuiz: weakQuiz);
    } else {
      final defaultWeakQuiz = ref.read(quizModelProvider.notifier).weakQuiz;
      state = state.copyWith(weakQuiz: defaultWeakQuiz);
    }
    final weakAllList = ref
        .read(quizModelProvider).quizList
        .expand((quiz) => quiz.quizItemList.where((quizItem) => quizItem.isWeak))
        .toList();
    // questionが同じものを重複しないようにまとめる
    final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    final weakList = weakSetList.map((question) {
      return weakAllList.firstWhere((quiz) => quiz.question == question);
    }).toList();
    final weakQuiz = ref
        .read(quizModelProvider.notifier)
        .weakQuiz
        .copyWith(quizItemList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
  }

  /// TestQuiz追加
  Future _getTestQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final testData = prefs.getString('test_quiz');
    if (testData != null) {
      final testQuiz = Quiz.fromJson(json.decode(testData));
      state = state.copyWith(testQuiz: testQuiz);
    } else {
      final defaultTestQuiz = ref
          .read(quizModelProvider.notifier)
          .testQuiz;
      state = state.copyWith(testQuiz: defaultTestQuiz);
    }
  }


  ///クイズ更新
  void updateQuiz(List<QuizItem> quiz) {
    final quizType = state.quizType;
    switch (quizType) {
      case QuizType.study:

        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.daily:
        ref.read(homeReviewScreenProvider.notifier).updateDailyItem(quiz);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.weak:
        _updateWeakQuiz(quiz);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.test:
        ref.read(homeReviewScreenProvider.notifier).updateTestItem(quiz);
        ref.read(homeReviewScreenProvider.notifier).updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
    }
  }

  ///クイズ更新
  void _updateStudyQuiz(List<QuizItem> quizItemList) {
    final quizList = state.quizList;
    final selectQuizIndex = state.selectQuizIndex;
    final correctNum =
        quizItemList.where((x) => x.isJudge == true).toList().length;
    final isCompleted = quizItemList.length == correctNum;

    final updateStudyQuiz = quizList.map((quiz) {
      if (quiz.title == quizList[selectQuizIndex].title) {
        return quizList[selectQuizIndex].copyWith(
          isCompleted: isCompleted,
          correctNum: correctNum,
          quizItemList: quizItemList,
          timeStamp: DateTime.now(),
        );
      }
      return quiz;
    }).toList();
    state = state.copyWith(quizList: updateStudyQuiz);
    _saveDevice();
  }

  ///Reviewクイズ更新・保存
  void _updateWeakQuiz(List<QuizItem> quizItemList) {
    final quizList = state.quizList;
    final nonWeakQuizList = quizItemList.where((x) => !x.isWeak).toList();
    // stateの各QuizItemStateのquizListをループして、nonWeakQuizListに含まれる同じquestionを持つクイズがある場合、そのクイズのisWeakをfalseに更新
    final updateStudyQuiz = quizList.map((quiz) {
      final updatedQuizList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz = nonWeakQuizList.firstWhereOrNull(
            (nonWeakQuiz) => nonWeakQuiz.question == quizItem.question);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: false);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updatedQuizList);
    }).toList();

    state = state.copyWith(quizList: updateStudyQuiz);
    _saveDevice();
  }

  /// 端末に保存する
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final quizListData =
        state.quizList.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('quiz_list', quizListData);
  }

  /// 現在のインデックスを取得し、更新
  void tapQuizItemBar(int quizIndex) {
    state = state.copyWith(selectQuizIndex: quizIndex);
  }

  void setQuizType(QuizType quizType) {
    state = state.copyWith(quizType: quizType);
  }

  List<Quiz> _initialQuizList() {
    // groupListsByを使用してリストをグループ化
    final groupMap = studyQuiz.groupListsBy((x) => x.category);
    // グループごとにリストをidでソート
    for (final group in groupMap.keys) {
      groupMap[group]!.sort((a, b) => a.id.compareTo(b.id));
    }
    // グループの順にリストを並べ替え
    final sortedGroups = groupMap.keys.toList()..sort((a, b) => a.compareTo(b));
    // グループごとのリストを結合して結果のリストを作成
    final quizList = <Quiz>[];
    for (final group in sortedGroups) {
      quizList.addAll(groupMap[group]!);
    }
    // ここで初期値を設定
    return quizList;
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = state.quizList.map((e) => json.encode(e.toJson())).toList();
    prefs.remove("quiz_list");
    await prefs.setStringList('quiz_list', data);
  }
}