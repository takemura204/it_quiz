import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/main/main_screen_controller.dart';
import 'package:kentei_quiz/model/quiz/quiz.dart';
import 'package:kentei_quiz/model/quiz/quizzes.dart';
import 'package:kentei_quiz/resource/quizzes_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../untils/enums.dart';
import '../quiz_item/quiz_item.dart';
import '../user/auth_model.dart';

final quizModelProvider = StateNotifierProvider<QuizModel, Quizzes>(
  (ref) => QuizModel(ref),
);

class QuizModel extends StateNotifier<Quizzes>  {
  QuizModel(this.ref) : super(Quizzes()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  final now = DateTime.now();


  Future initState() async {
    // _resetData();
    await _initQuizListData();
  }

  ///読み込み
  Future _initQuizListData() async {
    setIsLoading(true);
    await _getQuizListData();
    await Future.wait([
      _getWeakQuiz(),
      _getRandomQuiz(),
      _getHistoryQuiz(),
    ]);
    _saveDevice();
    setIsLoading(false);
  }

  /// 全クイズ取得
  Future _getQuizListData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final quizListDataJson = prefs.getStringList('quiz_list');
      List<Quiz> updatedQuizList = [];
      if (quizListDataJson != null && quizListDataJson.isNotEmpty) {
        final localQuizList = quizListDataJson.map((e) => Quiz.fromJson(json.decode(e))).toList();
        for (var localQuiz in localQuizList) {
          final matchedQuiz = initQuizList.firstWhereOrNull((q) => q.id == localQuiz.id);
          if (matchedQuiz != null) {
            // 更新されたクイズアイテムリストを作成
            final List<QuizItem> updatedQuizItems = [];
            // initQuizList に存在し、ローカルにも存在するクイズアイテムを更新
            for (var localQuizItem in localQuiz.quizItemList) {
              final matchedQuizItem = matchedQuiz.quizItemList
                  .firstWhereOrNull((item) => item.quizId == localQuizItem.quizId);
              if (matchedQuizItem != null) {
                final updatedQuizItem = localQuizItem.copyWith(
                  word: matchedQuizItem.word,
                  comment: matchedQuizItem.comment,
                  question: matchedQuizItem.question,
                  ans: matchedQuizItem.ans,
                  choices: matchedQuizItem.choices,
                  source: matchedQuizItem.source,
                  isPremium: matchedQuizItem.isPremium,
                  importance: matchedQuizItem.importance,
                );

                // ansがchoicesに含まれているかチェック
                if (!updatedQuizItem.choices.contains(updatedQuizItem.ans)) {
                  print("QuizItem with word: ${updatedQuizItem.word} ,${updatedQuizItem.quizId}.");
                }

                updatedQuizItems.add(updatedQuizItem);
              }
            }
            // initQuizList に存在し、ローカルにはないクイズアイテムを追加
            for (var initQuizItem in matchedQuiz.quizItemList) {
              if (!localQuiz.quizItemList
                  .any((localItem) => localItem.quizId == initQuizItem.quizId)) {
                // ansがchoicesに含まれているかチェック
                if (!initQuizItem.choices.contains(initQuizItem.ans)) {
                  print(
                      "QuizItem with word: ${initQuizItem.word} does not contain ans in choices.");
                }
                updatedQuizItems.add(initQuizItem);
              }
            }
            updatedQuizList.add(localQuiz.copyWith(
              title: matchedQuiz.title,
              categoryId: matchedQuiz.categoryId,
              category: matchedQuiz.category,
              quizItemList: updatedQuizItems,
              isPremium: matchedQuiz.isPremium,
            ));
          }
        }
        // initQuizList にしか存在しないクイズを追加
        final localQuizIds = localQuizList.map((quiz) => quiz.id).toSet();
        updatedQuizList.addAll(initQuizList.where((quiz) => !localQuizIds.contains(quiz.id)));
      } else {
        // 初回起動時は initQuizList をそのまま使用
        updatedQuizList = _initQuizList();
      }
      final Map<String, Quiz> uniqueQuizzes = {};
      for (var quiz in updatedQuizList) {
        final existingQuiz = uniqueQuizzes[quiz.id];
        if (existingQuiz == null ||
            (existingQuiz.title == quiz.title && initQuizList.contains(quiz))) {
          uniqueQuizzes[quiz.id.toString()] = quiz; // 重複がないか、initQuizList と title が一致する場合に保持
        }
      }
      updatedQuizList = uniqueQuizzes.values.toList(); // 重複が解消されたリストを更新
      updatedQuizList.sort((a, b) => a.id.compareTo(b.id));
      final quizItemList = updatedQuizList.expand((quiz) => quiz.quizItemList).toList();
      state = state.copyWith(quizList: updatedQuizList, quizItemList: quizItemList);
    } catch (e) {
      print("_getQuizListData Error: $e");
    }
  }

  ///苦手リスト取得
  Future _getWeakQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final weakQuizData = prefs.getString('weak_quiz');
    if (weakQuizData != null) {
      final weakQuiz = Quiz.fromJson(json.decode(weakQuizData));
      final weakQuizItemList = state.quizItemList.where((x) => x.isWeak).toList();
      final updateWeakQuiz = weakQuiz.copyWith(
        title: initWeakQuiz.title,
        categoryId: initWeakQuiz.categoryId,
        category: initWeakQuiz.category,
        quizItemList: weakQuizItemList,
        isPremium: initWeakQuiz.isPremium,
      );

      state = state.copyWith(weakQuiz: updateWeakQuiz);
    } else {
      //初回起動時
      state = state.copyWith(weakQuiz: initWeakQuiz);
    }
  }

  /// RandomQuiz追加
  Future _getRandomQuiz() async {
    final randomQuiz = initRandomQuiz;
    state = state.copyWith(randomQuiz: randomQuiz);
  }

  Future _getHistoryQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final historyListDataJson = prefs.getStringList('history_list');
    if (historyListDataJson != null && historyListDataJson.isNotEmpty) {
      final localHistoryQuizList = historyListDataJson.map((e) => Quiz.fromJson(json.decode(e))).toList();
      final updateHistoryQuizList = localHistoryQuizList.map((localQuiz) {
        final matchedQuiz = initQuizList.firstWhereOrNull((e) => e.id == localQuiz.id);
        if (matchedQuiz != null) {
          // 各クイズに対して、quizの更新
          return localQuiz.copyWith(
            title: matchedQuiz.title,
            categoryId: matchedQuiz.categoryId,
            category: matchedQuiz.category,
            isPremium: matchedQuiz.isPremium,
            quizItemList: localQuiz.quizItemList.map((quizItem) {
              final quizItemList = initQuizList.expand((quiz) => quiz.quizItemList).toList();
              final matchedQuizItem =
               quizItemList.firstWhereOrNull((e) => e.quizId == quizItem.quizId);
              if (matchedQuizItem != null) {
                return quizItem.copyWith(
                  word: matchedQuizItem.word,
                  comment: matchedQuizItem.comment,
                  question: matchedQuizItem.question,
                  ans: matchedQuizItem.ans,
                  choices: matchedQuizItem.choices,
                  source: matchedQuizItem.source,
                  isPremium: matchedQuizItem.isPremium,
                  importance: matchedQuizItem.importance,
                );
              }
              return quizItem;
            }).toList(),
          );
        }
        else {
          return localQuiz.copyWith(
            quizItemList: localQuiz.quizItemList.map((quizItem) {
              final quizItemList = initQuizList.expand((quiz) => quiz.quizItemList).toList();
              final matchedQuizItem =
              quizItemList.firstWhereOrNull((e) => e.quizId == quizItem.quizId);
              if (matchedQuizItem != null) {
                return quizItem.copyWith(
                  word: matchedQuizItem.word,
                  comment: matchedQuizItem.comment,
                  question: matchedQuizItem.question,
                  ans: matchedQuizItem.ans,
                  choices: matchedQuizItem.choices,
                  source: matchedQuizItem.source,
                  isPremium: matchedQuizItem.isPremium,
                  importance: matchedQuizItem.importance,
                );
              }
              return quizItem;
            }).toList(),
          );
        }
      }).toList();
      state = state.copyWith(historyQuizList: updateHistoryQuizList);
    }
    _saveDevice();
  }

  ///クイズ更新
  void updateQuiz(Quiz quiz) {
    final quizType = state.quizType;
    switch (quizType) {
      case QuizStyleType.study:
        _updateStudyQuiz(quiz);
        updateWeakItem();

        break;
      case QuizStyleType.weak:
        _updateWeakQuiz(quiz);
        updateWeakItem();
        break;
      case QuizStyleType.daily:
        // updateDailyItem(quizItemList);
        // updateWeakItem();
        break;
      case QuizStyleType.random:
        _updateTestQuiz(quiz);
        updateWeakItem();
        break;
    }
  }

  ///クイズ更新
  void _updateStudyQuiz(Quiz updateQuiz) {
    final quizList = state.quizList;
    final updateQuizList = quizList.map((quiz) {
      if (quiz.id == updateQuiz.id) {
        final goalScore = quiz.quizItemList.length;
        final updateScore =
            updateQuiz.quizItemList.where((x) => x.status == StatusType.correct).toList().length;
        final isCompleted = goalScore == updateScore;
        if (isCompleted) {
          ref.read(mainScreenControllerProvider.notifier).updateInAppReviewCount();
        }

        return updateQuiz.copyWith(isCompleted: isCompleted, correctNum: updateScore);
      }
      return quiz;
    }).toList();
    final updateQuizItemList = updateQuizList.expand((quiz) => quiz.quizItemList).toList();
    state = state.copyWith(quizList: updateQuizList, quizItemList: updateQuizItemList);
    _saveDevice();
  }

  //苦手クイズ更新・保存
  void _updateWeakQuiz(Quiz updateQuiz) {
    final quizList = state.quizList;
    final notWeakQuizItemList = updateQuiz.quizItemList.where((x) => !x.isWeak).toList();

    // quizListに、nonWeakQuizListと同じquestionが含まれる場合、isWeakをfalseに更新
    final updateQuizList = quizList.map((quiz) {
      final updateQuizItemList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz = notWeakQuizItemList
            .firstWhereOrNull((notWeakQuizItem) => notWeakQuizItem.quizId == quizItem.quizId);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: false);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updateQuizItemList);
    }).toList();
    final updateQuizItemList = updateQuizList.expand((quiz) => quiz.quizItemList).toList();

    state = state.copyWith(quizList: updateQuizList, quizItemList: updateQuizItemList);
    _saveDevice();
  }

  ///TestItem更新
  void _updateTestQuiz(Quiz updateQuiz) {
    final quizList = state.quizList;
    final quizItemList = updateQuiz.quizItemList;
    final weakQuizList = quizItemList.where((x) => x.isWeak).toList();

    final updateQuizList = quizList.map((quiz) {
      final updateQuizItemList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz =
            weakQuizList.firstWhereOrNull((weakQuiz) => weakQuiz.quizId == quizItem.quizId);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: true);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updateQuizItemList);
    }).toList();

    state = state.copyWith(quizList: updateQuizList, randomQuiz: updateQuiz);
    _saveDevice(); // 保存
  }

  /// HistoryQuiz追加
  Future createHistoryQuiz(Quiz updateQuiz) async {
    final historyQuizList = [...state.historyQuizList];
    historyQuizList.add(updateQuiz);
    state = state.copyWith(historyQuizList: historyQuizList);
    _saveDevice();
  }

  ///WeakItem更新
  Future updateWeakItem() async {
    //全ての苦手クイズから同じ問題を絞り込み
    final weakAllList = state.quizList
        .expand((quiz) => quiz.quizItemList.where((quizItem) => quizItem.isWeak))
        .toList();
    final weakSetList = weakAllList.map((quiz) => quiz.quizId).toSet();
    final weakList = weakSetList.map((quizId) {
      return weakAllList.firstWhere((quiz) => quiz.quizId == quizId);
    }).toList();
    final weakQuiz = state.weakQuiz?.copyWith(quizItemList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveDevice();
  }

  ///QuizItem更新
  void updateQuizItem(QuizItem updateQuizItem) {
    final quizList = state.quizList;
    final updatedQuizList = quizList.map((quiz) {
      final updatedQuizItemList = quiz.quizItemList.map((quizItem) {
        if (quizItem.quizId == updateQuizItem.quizId) {
          return updateQuizItem;
        }
        return quizItem;
      }).toList();
      return quiz.copyWith(quizItemList: updatedQuizItemList);
    }).toList();
    state = state.copyWith(quizList: updatedQuizList);
    _saveDevice(); // 保存
  }

  /// RandomQuiz作成
  void setRandomQuiz(List<String> testGroup, int testLength) {
    final isPremium = ref.read(authModelProvider).isPremium;
    final quizList = isPremium ? state.quizList : state.quizList.where((x) => !x.isPremium);
    final filteredQuizList = [
      ...quizList
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
    final randomQuiz = initRandomQuiz.copyWith(quizItemList: pickedQuizList);
    state = state.copyWith(randomQuiz: randomQuiz);
  }

  void setQuizIndex(int index) {
    state = state.copyWith(quizIndex: index);
  }

  void setQuizType(QuizStyleType quizType) {
    state = state.copyWith(quizType: quizType);
  }

  void setStudyType(StudyType studyType) {
    state = state.copyWith(studyType: studyType);
    print({'studyType',state.studyType});
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
    final quizListData = state.quizList.map((e) => json.encode(e.toJson())).toList();
    final historyListData = state.historyQuizList.map((e) => json.encode(e.toJson())).toList();
    final weakData = json.encode(state.weakQuiz?.toJson());
    final randomData = json.encode(state.randomQuiz?.toJson());
    await prefs.setStringList('quiz_list', quizListData);
    await prefs.setStringList('history_list', historyListData);
    await prefs.setString('weak_quiz', weakData);
    await prefs.setString('random_quiz', randomData);
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  /// 現在のstateをリセット
  Future resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("quiz_list");
    // prefs.remove("history_list");
    prefs.remove("weak_quiz");
    prefs.remove("test_quiz");
  }
}
