import 'dart:convert';

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
  void initState() {
    _initialize(); // 新しい初期化関数を呼び出す
    super.initState();
  }

  Future<void> _initialize() async {
    await _loadData(); // データを読み込む
    _updateData(); // クイズ追加
  }

  /// weakQuizを読み込み
  Future _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('weak_quiz');
    if (data != null) {
      final quiz = QuizItemState.fromJson(json.decode(data));
      state = state.copyWith(weakQuiz: quiz);
    }
  }

  ///クイズ更新
  Future<void> _updateData() async {
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

  ///クイズ更新
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

  ///weakQuizを保存
  Future _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = json.encode(state.weakQuiz.toJson());
    await prefs.setString('weak_quiz', data);
  }

  /// 端末に保存されているデータをリセットする
  // Future<void> _resetData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove("weak_quiz");
  // }
}
