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
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTapItem(int id) {
    print(id);
  }

  ///苦手リストに追加
  void addRememberQuestions(LearnQuiz checkQuiz) {
    final reviewQuizList = [...state.reviewQuestions];
    final rememberItem = state.reviewItem;

    if (reviewQuizList.any((x) => x.question == checkQuiz.question)) {
      print("同じクイズだよ！");
      return;
    }

    reviewQuizList.add(checkQuiz);

    rememberItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      rememberQuiz: reviewQuizList,
      choiceQuiz: [],
    );

    state = state.copyWith(
        reviewQuestions: reviewQuizList, reviewItem: rememberItem);
  }

  ///苦手リストから削除
  void removeRememberQuestions(LearnQuiz checkQuiz) {
    final reviewQuizList = [...state.reviewQuestions];
    reviewQuizList.remove(
        reviewQuizList.where((x) => x.question == checkQuiz.question).first);

    final rememberItem = state.reviewItem;
    rememberItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      rememberQuiz: reviewQuizList,
      choiceQuiz: [],
    );

    state = state.copyWith(
        reviewQuestions: reviewQuizList, reviewItem: rememberItem);
  }

  void addItem() {
    final reviewItem = [...state.reviewItem];
    reviewItem.addAll(
      [
        reviewItem1,
        reviewItem2,
      ],
    );
    state = state.copyWith(reviewItem: reviewItem);
  }
}

const reviewItem1 = QuizItem(
  id: 1,
  group: "rememberQuestions",
  title: "一問一答で復習する",
  rememberQuiz: [],
  choiceQuiz: [],
);

const reviewItem2 = QuizItem(
  id: 2,
  group: "rememberQuestions",
  title: "一問一答で復習する2",
  rememberQuiz: [],
  choiceQuiz: [],
);
