import 'dart:convert';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../resource/quiz_item/review_resource.dart';
import '../quiz/quiz_state.dart';
import '../quiz_item/quiz_item_controller.dart';
import '../quiz_item/quiz_item_state.dart';
import 'home_review_screen_state.dart';

final homeReviewScreenProvider =
    StateNotifierProvider<HomeReviewScreenController, HomeReviewScreenState>(
  (ref) => HomeReviewScreenController(ref: ref),
);

class HomeReviewScreenController extends StateNotifier<HomeReviewScreenState>
    with LocatorMixin {
  HomeReviewScreenController({required this.ref})
      : super(const HomeReviewScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  Future initState() async {
    // _resetData(); //データリセット
    await _loadData(); // データを読み込む
    await _updateData(); // クイズ追加
    super.initState();
  }

  ///クイズ読み込み
  Future _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyData = prefs.getString('daily_quiz');
    final weakData = prefs.getString('weak_quiz');
    final testData = prefs.getString('test_quiz');

    // dailyQuiz読み込み
    if (dailyData != null) {
      final dailyQuiz = QuizItemState.fromJson(json.decode(dailyData));
      state = state.copyWith(dailyQuiz: dailyQuiz);
    }
    // weakQuizを読み込み
    if (weakData != null) {
      final weakQuiz = QuizItemState.fromJson(json.decode(weakData));
      state = state.copyWith(weakQuiz: weakQuiz);
    }
    //testQuiz読み込み
    if (testData != null) {
      final testQuiz = QuizItemState.fromJson(json.decode(testData));
      state = state.copyWith(testQuiz: testQuiz);
    }
  }

  ///クイズ更新
  Future _updateData() async {
    addDailyQuiz(); // dailyQuiz追加
    addWeakQuiz(); // weakQuiz追加
  }

  /// dailyQuiz追加
  void addDailyQuiz() {
    final quizList = [
      ...ref
          .read(quizItemProvider)
          .expand((quizItem) => quizItem.quizList)
          .toList()
    ];
    final random = Random();
    final pickedQuizList = <QuizState>[];
    for (int i = 0; i < 5; i++) {
      if (quizList.isNotEmpty) {
        final randomIndex = random.nextInt(quizList.length);
        pickedQuizList.add(quizList[randomIndex]);
        quizList.removeAt(randomIndex);
      } else {
        break;
      }
    }
    final dailyQuiz = dailyItem.copyWith(quizList: pickedQuizList);
    state = state.copyWith(dailyQuiz: dailyQuiz);
    _saveData(); // 保存
  }

  /// weakQuiz追加
  void addWeakQuiz() {
    final weakAllList = ref
        .read(quizItemProvider)
        .expand((quizItem) => quizItem.quizList.where((quiz) => quiz.isWeak))
        .toList();
    // questionが同じものを重複しないようにまとめる
    final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    final weakList = weakSetList.map((question) {
      return weakAllList.firstWhere((quiz) => quiz.question == question);
    }).toList();
    final weakQuiz = weakItem.copyWith(quizList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveData(); // 保存
  }

  /// testQuiz追加
  void addTestQuiz() {
    final testGroup = state.testGroup;
    final testLength = state.selectedTestLength;
    final filteredQuizList = [
      ...ref
          .read(quizItemProvider)
          .where((quizItem) => testGroup.contains(quizItem.group))
          .expand((quizItem) => quizItem.quizList)
          .toList()
    ];
    final random = Random();
    final pickedQuizList = <QuizState>[];

    for (int i = 0; i < testLength; i++) {
      if (filteredQuizList.isNotEmpty) {
        final randomIndex = random.nextInt(filteredQuizList.length);
        pickedQuizList.add(filteredQuizList[randomIndex]);
        filteredQuizList.removeAt(randomIndex);
      } else {
        break;
      }
    }
    final testQuiz = testItem.copyWith(quizList: pickedQuizList);
    state = state.copyWith(testQuiz: testQuiz);
    _saveData(); // 保存
  }

  /// DailyItem
  void updateDailyItem(List<QuizState> quizList) {
    final score = state.dailyQuiz.score + 1;
    print("aa");
    final dailyQuiz = state.dailyQuiz.copyWith(
        score: score,
        isCompleted: true,
        quizList: quizList,
        timeStamp: DateTime.now());
    state = state.copyWith(dailyQuiz: dailyQuiz);
    _saveData(); // 保存
  }

  ///WeakItem更新
  Future<void> updateWeakItem(List<QuizState> quizList) async {
    //全ての苦手クイズから同じ問題を絞り込み
    final weakAllList = ref
        .read(quizItemProvider)
        .expand((quizItem) => quizItem.quizList.where((quiz) => quiz.isWeak))
        .toList();
    final weakSetList = weakAllList.map((quiz) => quiz.question).toSet();
    final weakList = weakSetList.map((question) {
      return weakAllList.firstWhere((quiz) => quiz.question == question);
    }).toList();
    final weakQuiz = state.weakQuiz.copyWith(quizList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveData(); // 保存
  }

  ///TestItem更新
  void updateTestItem(List<QuizState> quizList) {
    final score = (quizList.where((x) => x.isJudge == true).toList().length /
            quizList.length *
            100)
        .toInt();
    final isCompleted = quizList.length == score;
    final testQuiz = state.testQuiz.copyWith(
        score: score,
        isCompleted: isCompleted,
        quizList: quizList,
        timeStamp: DateTime.now());
    state = state.copyWith(testQuiz: testQuiz);
    _saveData(); // 保存
  }

  ///Quizを保存
  Future _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final dailyData = json.encode(state.dailyQuiz.toJson());
    final weakData = json.encode(state.weakQuiz.toJson());
    final testData = json.encode(state.testQuiz.toJson());

    await prefs.setString('daily_quiz', dailyData);
    await prefs.setString('weak_quiz', weakData);
    await prefs.setString('test_quiz', testData);
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
