import 'dart:convert';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_item.dart';
import '../../model/quiz/quiz_model.dart';
import 'home_review_screen_state.dart';

final homeReviewScreenProvider =
    StateNotifierProvider<HomeReviewScreenController, HomeReviewScreenState>(
  (ref) => HomeReviewScreenController(ref: ref),
);

class HomeReviewScreenController extends StateNotifier<HomeReviewScreenState>
    with LocatorMixin {
  HomeReviewScreenController({required this.ref})
      : super( HomeReviewScreenState()) {
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
    // _resetData(); //データリセット
    await loadQuizData(); // データを読み込む
    super.initState();
  }

  ///クイズ読み込み
  Future loadQuizData() async {
    _getDailyQuiz();
    _getWeakQuiz();
    _getTestQuiz();
    _getRunningDay();
    _saveData();
  }

  /// dailyQuiz追加
  Future _getDailyQuiz() async {
    final now = DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    final dailyQuizData = prefs.getString('daily_quiz');
    // dailyQuiz読み込み
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
          .expand((quiz) => quiz.quizItemList)
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
      final updateDailyQuiz = dailyQuiz.copyWith(quizList: pickedQuizList);
      state = state.copyWith(dailyQuiz: updateDailyQuiz);
    }
  }

  /// weakQuiz追加
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
      final defaultTestQuiz = ref.read(quizModelProvider.notifier).testQuiz;
      state = state.copyWith(testQuiz: defaultTestQuiz);
    }
  }

  Future _getRunningDay() async {
    final prefs = await SharedPreferences.getInstance();
    final runningDayData = prefs.getInt('running_day');
    if (runningDayData != null) {
      final runningDay = runningDayData;
      state = state.copyWith(runningDay: runningDay);
    }
  }

  /// testQuiz追加
  void updateTestQuiz() {
    final testGroup = state.testGroup;
    final testLength = state.selectedTestLength;
    final filteredQuizList = [
      ...ref
          .read(quizModelProvider).quizList
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
    final testQuiz = ref
        .read(quizModelProvider.notifier)
        .testQuiz
        .copyWith(quizItemList: pickedQuizList);
    state = state.copyWith(testQuiz: testQuiz);
  }

  /// DailyItem
  void updateDailyItem(List<QuizItem> quizList) {
    final now = DateTime.now();
    final correctNum = quizList.where((x) => x.isJudge == true).toList().length;
    final runningDay = state.runningDay;
    final dailyQuiz = state.dailyQuiz!;
    final timeStamp = dailyQuiz.timeStamp;
    final nowDate = DateTime(now.year, now.month, now.day);
    int updatedRunningDay = runningDay; // 初期値として現在のdailyScoreを設定

    //初回のみ or 違う日の時更新
    if (timeStamp == null || !_isSameDay(timeStamp, nowDate)) {
      updatedRunningDay++; // タイムスタンプがnullまたは日付が違う場合、スコアをインクリメント
    }
    final updateDailyQuiz = dailyQuiz.copyWith(
        correctNum: correctNum,
        isCompleted: true,
        quizList: quizList,
        timeStamp: nowDate);

    state = state.copyWith(
        dailyQuiz: updateDailyQuiz, runningDay: updatedRunningDay);
    _saveData(); // 保存
  }

  ///WeakItem更新
  Future updateWeakItem() async {
    //全ての苦手クイズから同じ問題を絞り込み
    final weakAllList = ref
        .read(quizModelProvider).quizList
        .expand((quiz) => quiz.quizItemList.where((quizItem) => quizItem.isWeak))
        .toList();
    final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    final weakList = weakSetList.map((question) {
      return weakAllList.firstWhere((quiz) => quiz.question == question);
    }).toList();
    final weakQuiz = state.weakQuiz.copyWith(quizItemList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveData(); // 保存
  }

  ///TestItem更新
  void updateTestItem(List<QuizItem> quizList) {
    final correctNum =
        (quizList.where((x) => x.isJudge == true).toList().length /
                quizList.length *
                100)
            .toInt();
    final isCompleted = quizList.length == correctNum;
    final testQuiz = state.testQuiz!.copyWith(
        correctNum: correctNum,
        isCompleted: isCompleted,
        quizList: quizList,
        timeStamp: DateTime.now());
    state = state.copyWith(testQuiz: testQuiz);
    _saveData(); // 保存
  }

  ///Quizを保存
  Future _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyData = json.encode(state.dailyQuiz!.toJson());
    final runningDay = state.runningDay;
    final weakData = json.encode(state.weakQuiz.toJson());
    final testData = json.encode(state.testQuiz.toJson());

    await prefs.setString('daily_quiz', dailyData);
    await prefs.setString('weak_quiz', weakData);
    await prefs.setString('test_quiz', testData);
    await prefs.setInt('running_day', runningDay);
  }

  /// 端末に保存されているデータをリセットする
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("daily_quiz");
    prefs.remove("weak_quiz");
    prefs.remove("test_quiz");
  }

  ///問題範囲指定
  void selectGroup(String group) {
    final testGroup = [...state.testGroup];
    if (testGroup.contains(group)) {
      state = state.copyWith(testGroup: testGroup..remove(group));
    } else {
      state = state.copyWith(testGroup: testGroup..add(group));
    }
  }

  ///問題数指定
  void selectTestLength(int length) {
    state = state.copyWith(selectedTestLength: length);
  }
}
