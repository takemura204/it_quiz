import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz_item.dart';
import 'home_review_screen_state.dart';

final homeReviewScreenControllerProvider =
    StateNotifierProvider<HomeReviewScreenController, HomeReviewScreenState>(
  (ref) => HomeReviewScreenController(ref: ref),
);

class HomeReviewScreenController extends StateNotifier<HomeReviewScreenState>
    with LocatorMixin {
  HomeReviewScreenController({required this.ref})
      : super(const HomeReviewScreenState());

  final Ref ref;

  @override
  void initState() {
    addItem();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addItem() {
    final reviewItem = [...state.reviewItem];
    reviewItem.addAll(
      [
        reviewLearnQuiz,
        reviewChoiceQuiz,
      ],
    );
    state = state.copyWith(reviewItem: reviewItem);
  }

  ///一問一答リストに追加
  void addLearnQuiz(LearnQuiz learnQuiz) {
    final learnList = [...state.learnList];
    final rememberItem = state.reviewItem;
    //同じクイズの時
    if (learnList.any((x) => x.question == learnQuiz.question)) {
      return;
    }

    learnList.add(learnQuiz);

    //reviewLearnQuizに追加
    rememberItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      learnQuiz: learnList,
      choiceQuiz: [],
    );

    state = state.copyWith(learnList: learnList, reviewItem: rememberItem);
  }

  ///一問一答リストから削除
  void removeLearnQuiz(LearnQuiz learnQuiz) {
    final learnList = [...state.learnList];
    final rememberItem = state.reviewItem;
    learnList
        .remove(learnList.where((x) => x.question == learnQuiz.question).first);
    rememberItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      learnQuiz: learnList,
      choiceQuiz: [],
    );

    state = state.copyWith(learnList: learnList, reviewItem: rememberItem);
  }

  ///4択リストに追加
  void addChoiceQuiz(ChoiceQuiz choiceQuiz) {
    final choiceList = [...state.choiceList];
    final rememberItem = state.reviewItem;

    //同じクイズの時
    if (choiceList.any((x) => x.question == choiceQuiz.question)) {
      return;
    }

    choiceList.add(choiceQuiz);

    rememberItem[1] = QuizItem(
      id: 2,
      group: "LearnQuiz",
      title: "一問一答で復習する",
      learnQuiz: [],
      choiceQuiz: choiceList,
    );

    state = state.copyWith(choiceList: choiceList, reviewItem: rememberItem);
  }

  ///4択リストから削除
  void removeChoiceQuiz(ChoiceQuiz choiceQuiz) {
    final choiceList = [...state.choiceList];
    final reviewItem = state.reviewItem;
    choiceList.remove(
        choiceList.where((x) => x.question == choiceQuiz.question).first);

    //選択問題に追加
    reviewItem[1] = QuizItem(
      id: 2,
      group: "ChoiceQuiz",
      title: "一問一答で復習する",
      learnQuiz: [],
      choiceQuiz: choiceList,
    );

    state = state.copyWith(choiceList: choiceList, reviewItem: reviewItem);
  }
}

const reviewLearnQuiz = QuizItem(
  id: 1,
  group: "LearnQuiz",
  title: "一問一答で復習する",
  learnQuiz: [],
  choiceQuiz: [],
);

const reviewChoiceQuiz = QuizItem(
  id: 2,
  group: "ChoiceQuiz",
  title: "一問一答で復習する2",
  learnQuiz: [],
  choiceQuiz: [],
);
