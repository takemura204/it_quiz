import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/dashboard_analytics/dashboard_analytics_controller.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:kentei_quiz/model/quiz/quizzes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

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
  final now = DateTime.now();

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
    _resetData();
    await _loadQuizData(); // データを読み込む
    super.initState();
  }

  ///読み込み
  Future _loadQuizData() async {
    _getQuizListData();
    await Future.wait([
      _getDailyQuiz(),
      _getWeakQuiz(),
      _getTestQuiz(),
    ]);
    _saveDevice();
  }

  /// 全クイズ取得
  Future _getQuizListData() async {
    final prefs = await SharedPreferences.getInstance();
    final quizListDataJson = prefs.getStringList('quiz_list');
    if (quizListDataJson != null && quizListDataJson.isNotEmpty) {
      final getQuizList =
          quizListDataJson.map((e) => Quiz.fromJson(json.decode(e))).toList();
      final updateQuizList = getQuizList.map((quiz) {
        // studyQuizから、対応するアイテムを探す
        final updatedItem =
            initQuizList.firstWhereOrNull((e) => e.id == quiz.id);
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
      final _initialQuizList = _initQuizList();
      state = state.copyWith(quizList: _initialQuizList);
    }
  }

  /// DailyQuiz取得
  Future _getDailyQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyQuizData = prefs.getString('daily_quiz');
    if (dailyQuizData != null) {
      final dailyQuiz = Quiz.fromJson(json.decode(dailyQuizData));
      final quizItemList = [
        ...state.quizList.expand((quiz) => quiz.quizItemList).toList()
      ];
      final pickedQuizList = <QuizItem>[];
      final timeStamp = dailyQuiz.timeStamp;
      final saveDate = timeStamp != null
          ? DateTime(timeStamp.year, timeStamp.month, timeStamp.day)
          : null;
      final nowDate = DateTime(now.year, now.month, now.day);

      //初回 or 違う日の時新しく生成
      if (timeStamp == null || !_isSameDay(saveDate, nowDate)) {
        for (int i = 0; i < 5; i++) {
          if (quizItemList.isNotEmpty) {
            final random = Random();
            final randomIndex = random.nextInt(quizItemList.length);
            pickedQuizList.add(quizItemList[randomIndex]);
            quizItemList.removeAt(randomIndex);
          }
        }
        final createDailyQuiz =
            dailyQuiz.copyWith(quizItemList: pickedQuizList);
        state = state.copyWith(dailyQuiz: createDailyQuiz);
      }
      //同じ日の場合
      else {
        state = state.copyWith(dailyQuiz: dailyQuiz);
      }
    }
    //初回起動の場合
    else {
      state = state.copyWith(dailyQuiz: initDailyQuiz);
    }
  }

  ///苦手リスト取得
  Future _getWeakQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final weakQuizData = prefs.getString('weak_quiz');
    if (weakQuizData != null) {
      final weakQuiz = Quiz.fromJson(json.decode(weakQuizData));
      state = state.copyWith(weakQuiz: weakQuiz);
    }
    //初回起動時
    else {
      state = state.copyWith(weakQuiz: initWeakQuiz);
    }
  }

  /// TestQuiz追加
  Future _getTestQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final testData = prefs.getString('test_quiz');
    if (testData != null) {
      final testQuiz = Quiz.fromJson(json.decode(testData));
      state = state.copyWith(testQuiz: testQuiz);
    } else {
      state = state.copyWith(testQuiz: initTestQuiz);
    }
  }

  ///クイズ更新
  void updateQuiz(List<QuizItem> quiz) {
    final quizType = state.quizType;
    switch (quizType) {
      case QuizType.study:
        _updateQuiz(quiz);
        updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.daily:
        updateDailyItem(quiz);
        updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.weak:
        _updateWeakQuiz(quiz);
        updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
      case QuizType.test:
        _updateTestItem(quiz);
        updateWeakItem();
        ref.read(dashboardAnalyticsProvider.notifier).updateScore(quiz);
        break;
    }
  }

  ///クイズ更新
  void _updateQuiz(List<QuizItem> quizItemList) {
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

  //苦手クイズ更新・保存
  void _updateWeakQuiz(List<QuizItem> quizItemList) {
    final quizList = state.quizList;
    final nonWeakQuizList = quizItemList.where((x) => !x.isWeak).toList();

    // quizListに、nonWeakQuizListと同じquestionが含まれる場合、isWeakをfalseに更新
    final updateQuizList = quizList.map((quiz) {
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

    state = state.copyWith(quizList: updateQuizList);
    _saveDevice();
  }

  /// DailyItem
  void updateDailyItem(List<QuizItem> quizItemList) {
    final correctNum =
        quizItemList.where((x) => x.isJudge == true).toList().length;
    final dailyQuiz = state.dailyQuiz;
    final nowDate = DateTime(now.year, now.month, now.day);
    final updateDailyQuiz = dailyQuiz.copyWith(
        correctNum: correctNum,
        isCompleted: true,
        quizItemList: quizItemList,
        timeStamp: nowDate);
    state = state.copyWith(dailyQuiz: updateDailyQuiz);
    _saveDevice(); // 保存
  }

  ///WeakItem更新
  Future updateWeakItem() async {
    //全ての苦手クイズから同じ問題を絞り込み
    final weakAllList = state.quizList
        .expand(
            (quiz) => quiz.quizItemList.where((quizItem) => quizItem.isWeak))
        .toList();
    final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    final weakList = weakSetList.map((question) {
      return weakAllList.firstWhere((quiz) => quiz.question == question);
    }).toList();
    final weakQuiz = state.weakQuiz.copyWith(quizItemList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveDevice();
  }

  ///TestItem更新
  void _updateTestItem(List<QuizItem> quizItemList) {
    final quizList = state.quizList;
    final weakQuizList = quizItemList.where((x) => x.isWeak).toList();

    final updateQuizList = quizList.map((quiz) {
      final updateQuizItemList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz = weakQuizList.firstWhereOrNull(
            (weakQuiz) => weakQuiz.question == quizItem.question);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: true);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updateQuizItemList);
    }).toList();

    state = state.copyWith(quizList: updateQuizList);

    final correctNum =
        (quizItemList.where((x) => x.isJudge == true).toList().length /
                quizItemList.length *
                100)
            .toInt();
    print(correctNum);
    final isCompleted = quizItemList.length == correctNum;
    final testQuiz = state.testQuiz.copyWith(
        correctNum: correctNum,
        isCompleted: isCompleted,
        quizItemList: quizItemList,
        timeStamp: DateTime.now());
    state = state.copyWith(testQuiz: testQuiz);
    _saveDevice(); // 保存
  }

  /// TestQuiz作成
  void createTestQuiz(List<String> testGroup, int testLength) {
    final filteredQuizList = [
      ...state.quizList
          .where((quizItem) => testGroup.contains(quizItem.category))
          .expand((quizItem) => quizItem.quizItemList)
          .toList()
    ];
    final random = Random();
    final pickedQuizList = <QuizItem>[];
    for (int i = 0; i < testLength; i++) {
      if (filteredQuizList.isNotEmpty) {
        final randomIndex = random.nextInt(filteredQuizList.length);
        pickedQuizList.add(filteredQuizList[randomIndex]);
        filteredQuizList.removeAt(randomIndex);
      } else {
        break;
      }
    }
    final testQuiz = initTestQuiz.copyWith(quizItemList: pickedQuizList);
    state = state.copyWith(testQuiz: testQuiz);
  }

  /// 現在のインデックスを取得し、更新
  void tapQuizItemBar(int quizIndex) {
    state = state.copyWith(selectQuizIndex: quizIndex);
  }

  void setQuizType(QuizType quizType) {
    state = state.copyWith(quizType: quizType);
  }

  List<Quiz> _initQuizList() {
    // groupListsByを使用してリストをグループ化
    final groupMap = initQuizList.groupListsBy((x) => x.category);
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

  /// 端末に保存する
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final quizListData =
        state.quizList.map((e) => json.encode(e.toJson())).toList();
    final dailyData = json.encode(state.dailyQuiz.toJson());
    final weakData = json.encode(state.weakQuiz.toJson());
    final testData = json.encode(state.testQuiz.toJson());

    await prefs.setStringList('quiz_list', quizListData);
    await prefs.setString('daily_quiz', dailyData);
    await prefs.setString('weak_quiz', weakData);
    await prefs.setString('test_quiz', testData);
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("quiz_list");
    prefs.remove("daily_quiz");
    prefs.remove("weak_quiz");
    prefs.remove("test_quiz");
  }
}
