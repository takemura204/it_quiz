import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/quiz/quiz_item_resource.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz_state.dart';
import 'home_study_screen_state.dart';

final homeStudyScreenControllerProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => HomeStudyScreenController(ref: ref),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin {
  HomeStudyScreenController({required this.ref})
      : super(const HomeStudyScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    addQuizItemList();
    super.initState();
  }

  ///クイズ追加
  void addQuizItemList() {
    final quizItemList = [...state.quizItemList];
    final sortedList = groupAndSort(quizItems);
    quizItemList.addAll(sortedList);
    state = state.copyWith(quizItemList: quizItemList);
  }

  ///QuizItemBarをタップした時
  void tapQuizItemBar(int index) {
    setItemIndex(index); //問題番号を設定
    // setQuizItem(true, state.quizItemList[index].quizList);
  }

  ///クイズ番号更新
  void setItemIndex(int index) {
    state = state.copyWith(itemIndex: index);
  }

  ///クイズ更新
  void setQuizItem(bool isCompleted, List<QuizState> quizList) {
    final quizItemList = [...quizItems];
    final itemIndex = state.itemIndex;
    final score = quizList.where((x) => x.isJudge == true).toList().length;
    quizItemList[itemIndex] = QuizItemState(
      id: quizItemList[itemIndex].id,
      group: quizItemList[itemIndex].group,
      title: quizItemList[itemIndex].title,
      isCompleted: true,
      quizList: quizItemList[itemIndex].quizList,
      score: score,
    );

    print(quizItemList[itemIndex].isCompleted);

    state = state.copyWith(quizItemList: quizItemList);
  }

  List<QuizItemState> groupAndSort(List<QuizItemState> items) {
    // groupListsByを使用してリストをグループ化
    final groupMap = items.groupListsBy((x) => x.group);

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

    return result;
  }
}
