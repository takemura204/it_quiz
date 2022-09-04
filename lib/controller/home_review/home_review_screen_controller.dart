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
        reviewTrueFalseQuiz,
      ],
    );
    state = state.copyWith(reviewItem: reviewItem);
  }

  ///一問一答リストに追加
  void addLearnQuiz(LearnQuiz learnQuiz) {
    final learnList = [...state.learnList];
    final reviewItem = state.reviewItem;
    //同じクイズの時
    if (learnList.any((x) => x.question == learnQuiz.question)) {
      return;
    }

    learnList.add(learnQuiz);

    //reviewLearnQuizに追加
    reviewItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      learnQuiz: learnList,
      choiceQuiz: [],
      trueFalseQuiz: [],
    );

    state = state.copyWith(learnList: learnList, reviewItem: reviewItem);
  }

  ///一問一答リストから削除
  void removeLearnQuiz(LearnQuiz learnQuiz) {
    final learnList = [...state.learnList];
    final reviewItem = state.reviewItem;
    learnList
        .remove(learnList.where((x) => x.question == learnQuiz.question).first);
    reviewItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      learnQuiz: learnList,
      choiceQuiz: [],
      trueFalseQuiz: [],
    );

    state = state.copyWith(learnList: learnList, reviewItem: reviewItem);
  }

  ///4択リストに追加
  void addChoiceQuiz(ChoiceQuiz choiceQuiz) {
    final choiceList = [...state.choiceList];
    final reviewItem = state.reviewItem;

    //同じクイズの時
    if (choiceList.any((x) => x.question == choiceQuiz.question)) {
      return;
    }

    choiceList.add(choiceQuiz);

    reviewItem[1] = QuizItem(
      id: 2,
      group: "LearnQuiz",
      title: "一問一答で復習する",
      learnQuiz: [],
      choiceQuiz: choiceList,
      trueFalseQuiz: [],
    );

    state = state.copyWith(choiceList: choiceList, reviewItem: reviewItem);
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
      trueFalseQuiz: [],
    );

    state = state.copyWith(choiceList: choiceList, reviewItem: reviewItem);
  }

  ///○×クイズに追加
  void addTrueFalseQuiz(TrueFalseQuiz trueFalseQuiz) {
    final trueFalseList = [...state.trueFalseList];
    final reviewItem = state.reviewItem;

    //同じクイズの時
    if (trueFalseList.any((x) => x.question == trueFalseQuiz.question)) {
      return;
    }

    trueFalseList.add(trueFalseQuiz);

    reviewItem[2] = QuizItem(
      id: 3,
      group: "TrueFalseQuiz",
      title: "○×問題で復習する",
      learnQuiz: [],
      choiceQuiz: [],
      trueFalseQuiz: trueFalseList,
    );

    print(reviewItem[2].trueFalseQuiz.length);

    state =
        state.copyWith(trueFalseList: trueFalseList, reviewItem: reviewItem);
  }

  ///○×クイズから削除
  void removeTrueFalseQuiz(TrueFalseQuiz trueFalseQuiz) {
    final trueFalseList = [...state.trueFalseList];
    final reviewItem = state.reviewItem;
    trueFalseList.remove(
        trueFalseList.where((x) => x.question == trueFalseQuiz.question).first);

    //○×問題から削除
    reviewItem[2] = QuizItem(
      id: 3,
      group: "TrueFalseQuiz",
      title: "○×問題で復習する",
      learnQuiz: [],
      choiceQuiz: [],
      trueFalseQuiz: trueFalseList,
    );

    print(reviewItem[2].trueFalseQuiz.length);
    state =
        state.copyWith(trueFalseList: trueFalseList, reviewItem: reviewItem);
  }
}

const reviewLearnQuiz = QuizItem(
  id: 1,
  group: "LearnQuiz",
  title: "一問一答で復習する",
  learnQuiz: [],
  choiceQuiz: [],
  trueFalseQuiz: [],
);

const reviewChoiceQuiz = QuizItem(
  id: 2,
  group: "ChoiceQuiz",
  title: "選択問題で復習する",
  learnQuiz: [],
  choiceQuiz: [],
  trueFalseQuiz: [],
);

const reviewTrueFalseQuiz = QuizItem(
  id: 3,
  group: "TrueFalseQuiz",
  title: "○×問題で復習する",
  learnQuiz: [],
  choiceQuiz: [],
  trueFalseQuiz: [],
);
