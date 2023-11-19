import 'dart:convert';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    // _resetData();
    await _loadQuizData(); // データを読み込む
    super.initState();
  }

  ///読み込み
  Future _loadQuizData() async {
    await _getQuizListData();
    await _getWeakQuiz();
    await _getTestQuiz();
    await _getHistoryQuiz();
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
            title: updatedItem.title,
            category: updatedItem.category,
            quizItemList: quiz.quizItemList.map((quizItem) {
              // updatedItemのクイズリストから、対応するクイズを探す
              final updatedQuiz = updatedItem.quizItemList
                  .firstWhereOrNull((e) => e.quizId == quizItem.quizId);
              if (updatedQuiz != null) {
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
      final quizItemList =
          updateQuizList.expand((x) => x.quizItemList).toList();
      state =
          state.copyWith(quizList: updateQuizList, quizItemList: quizItemList);
    }
    // 初回起動時
    else {
      final _initialQuizList = _initQuizList();
      final quizItemList =
          _initialQuizList.expand((x) => x.quizItemList).toList();
      state = state.copyWith(
          quizList: _initialQuizList, quizItemList: quizItemList);
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
      print('a');
      state = state.copyWith(weakQuiz: initWeakQuiz);
    }
    print(state.weakQuiz?.quizItemList);
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

  Future _getHistoryQuiz() async {
    final prefs = await SharedPreferences.getInstance();
    final historyListDataJson = prefs.getStringList('history_list');
    if (historyListDataJson != null && historyListDataJson.isNotEmpty) {
      final getQuizList = historyListDataJson
          .map((e) => Quiz.fromJson(json.decode(e)))
          .toList();
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
      state = state.copyWith(historyQuizList: updateQuizList);
    }
    _saveDevice();
  }

  ///クイズ更新
  void updateQuiz(Quiz quiz) {
    final quizType = state.quizType;
    switch (quizType) {
      case QuizType.study:
        _updateStudyQuiz(quiz);
        updateWeakItem();

        break;
      case QuizType.weak:
        _updateWeakQuiz(quiz);
        updateWeakItem();
        break;
      case QuizType.daily:
        // updateDailyItem(quizItemList);
        // updateWeakItem();

        break;
      case QuizType.test:
        _updateTestQuiz(quiz);
        updateWeakItem();

        break;
    }
  }

  ///クイズ更新
  void _updateStudyQuiz(Quiz updateQuiz) {
    final quizList = state.quizList;
    final selectQuizId = state.selectQuizId;
    final updateStudyQuiz = quizList.map((quiz) {
      if (quiz.id == selectQuizId) {
        return updateQuiz;
      }
      return quiz;
    }).toList();
    state = state.copyWith(quizList: updateStudyQuiz);
    _saveDevice();
  }

  //苦手クイズ更新・保存
  void _updateWeakQuiz(Quiz quiz) {
    final quizList = state.quizList;
    final quizItemList = quiz.quizItemList;
    final notWeakQuizItemList = quizItemList.where((x) => !x.isWeak).toList();

    // quizListに、nonWeakQuizListと同じquestionが含まれる場合、isWeakをfalseに更新
    final updateQuizList = quizList.map((quiz) {
      final updateQuizItemList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz = notWeakQuizItemList.firstWhereOrNull(
            (notWeakQuizItem) => notWeakQuizItem.quizId == quizItem.quizId);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: false);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updateQuizItemList);
    }).toList();

    state = state.copyWith(quizList: updateQuizList);
    _saveDevice();
  }

  ///TestItem更新
  void _updateTestQuiz(Quiz updateQuiz) {
    final quizList = state.quizList;
    final quizItemList = updateQuiz.quizItemList;
    final weakQuizList = quizItemList.where((x) => x.isWeak).toList();

    final updateQuizList = quizList.map((quiz) {
      final updateQuizItemList = quiz.quizItemList.map((quizItem) {
        final updatedQuiz = weakQuizList
            .firstWhereOrNull((weakQuiz) => weakQuiz.quizId == quizItem.quizId);
        if (updatedQuiz != null) {
          return quizItem.copyWith(isWeak: true);
        }
        return quizItem;
      }).toList();
      // 更新されたquizListを含む新しいQuizItemStateを作成し、stateの対応する要素に置き換え
      return quiz.copyWith(quizItemList: updateQuizItemList);
    }).toList();

    state = state.copyWith(quizList: updateQuizList, testQuiz: updateQuiz);
    _saveDevice(); // 保存
  }

  /// HistoryQuiz更新
  Future addHistoryQuiz(Quiz updateQuiz) async {
    // 1. 現在のhistoryQuizListをコピー
    final historyQuizList = [...state.historyQuizList];

    // 2. updateQuizをhistoryQuizListに追加
    historyQuizList.add(updateQuiz);

    // 3. historyQuizList内の同じidのQuizのquizItemListを更新
    for (var i = 0; i < historyQuizList.length; i++) {
      if (historyQuizList[i].id == updateQuiz.id) {
        final updatedQuizItemList =
            historyQuizList[i].quizItemList.map((quizItem) {
          // updateQuizの中から対応するquizItemを見つける
          final updatedItem = updateQuiz.quizItemList
              .firstWhereOrNull((e) => e.quizId == quizItem.quizId);
          if (updatedItem != null) {
            // isWeakだけを更新
            return quizItem.copyWith(isWeak: updatedItem.isWeak);
          }
          return quizItem;
        }).toList();
        historyQuizList[i] =
            historyQuizList[i].copyWith(quizItemList: updatedQuizItemList);
      }
    }

    // 4. 更新したhistoryQuizListでstateを更新
    state = state.copyWith(historyQuizList: historyQuizList);

    // 5. デバイスに保存
    _saveDevice();
  }

  Future updateHistoryQuiz(Quiz updateQuiz) async {
    // 1. 現在のhistoryQuizListをコピー
    final historyQuizList = [...state.historyQuizList];

    // 3. historyQuizList内の同じidのQuizのquizItemListを更新
    for (var i = 0; i < historyQuizList.length; i++) {
      if (historyQuizList[i].id == updateQuiz.id) {
        final updatedQuizItemList =
            historyQuizList[i].quizItemList.map((quizItem) {
          // updateQuizの中から対応するquizItemを見つける
          final updatedItem = updateQuiz.quizItemList
              .firstWhereOrNull((e) => e.quizId == quizItem.quizId);
          if (updatedItem != null) {
            // isWeakだけを更新
            return quizItem.copyWith(isWeak: updatedItem.isWeak);
          }
          return quizItem;
        }).toList();
        historyQuizList[i] =
            historyQuizList[i].copyWith(quizItemList: updatedQuizItemList);
      }
    }

    // 4. 更新したhistoryQuizListでstateを更新
    state = state.copyWith(historyQuizList: historyQuizList);

    // 5. デバイスに保存
    _saveDevice();
  }

  ///WeakItem更新
  Future updateWeakItem() async {
    //全ての苦手クイズから同じ問題を絞り込み
    final weakAllList = state.quizList
        .expand(
            (quiz) => quiz.quizItemList.where((quizItem) => quizItem.isWeak))
        .toList();
    final weakSetList = weakAllList.map((quiz) => quiz.quizId).toSet();
    final weakList = weakSetList.map((quizId) {
      return weakAllList.firstWhere((quiz) => quiz.quizId == quizId);
    }).toList();
    final weakQuiz = state.weakQuiz?.copyWith(quizItemList: weakList);
    state = state.copyWith(weakQuiz: weakQuiz);
    _saveDevice();
  }

  ///SavedQuiz更新
  void updateSavedQuiz(QuizItem quizItem) {
    final quizList = state.quizList;
    final updatedQuizList = quizList.map((quiz) {
      final updatedQuizItemList = quiz.quizItemList.map((item) {
        if (item.quizId == quizItem.quizId) {
          return quizItem;
        }
        return item;
      }).toList();
      return quiz.copyWith(quizItemList: updatedQuizItemList);
    }).toList();
    state = state.copyWith(quizList: updatedQuizList);
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
  void tapQuizCard(int quizId) {
    state = state.copyWith(selectQuizId: quizId);
  }

  void setQuizType(QuizType quizType) {
    state = state.copyWith(quizType: quizType);
  }

  void setStudyType(StudyType studyType) {
    state = state.copyWith(studyType: studyType);
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
    final historyListData =
        state.historyQuizList.map((e) => json.encode(e.toJson())).toList();
    final weakData = json.encode(state.weakQuiz?.toJson());
    final testData = json.encode(state.testQuiz?.toJson());

    await prefs.setStringList('quiz_list', quizListData);
    await prefs.setStringList('history_list', historyListData);
    await prefs.setString('weak_quiz', weakData);
    await prefs.setString('test_quiz', testData);
  }

  /// 現在のstateをリセット
  Future _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("quiz_list");
    prefs.remove("history_list");
    prefs.remove("weak_quiz");
    prefs.remove("test_quiz");
  }
}
