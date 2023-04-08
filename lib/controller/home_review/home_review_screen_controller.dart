import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entity/quiz.dart';
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
  void addLearnQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;
    //同じクイズの時
    if (quizList.any((x) => x.question == quiz.question)) {
      return;
    }

    quizList.add(quiz);

    //reviewLearnQuizに追加
    reviewItem[0] = QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      quizList: quizList,
      isCompleted: false,
    );

    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }

  ///一問一答リストから削除
  void removeLearnQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;
    quizList.remove(quizList.where((x) => x.question == quiz.question).first);
    reviewItem[0] = const QuizItem(
      id: 1,
      group: "rememberQuestions",
      title: "一問一答で復習する",
      isCompleted: false,
      quizList: [],
    );

    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }

  ///4択リストに追加
  void addChoiceQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;

    //同じクイズの時
    if (quizList.any((x) => x.question == quiz.question)) {
      return;
    }

    quizList.add(quiz);

    reviewItem[1] = QuizItem(
      id: 2,
      group: "LearnQuiz",
      title: "一問一答で復習する",
      isCompleted: false,
      quizList: quizList,
    );

    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }

  ///4択リストから削除
  void removeChoiceQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;
    quizList.remove(quizList.where((x) => x.question == quiz.question).first);

    //選択問題に追加
    reviewItem[1] = QuizItem(
      id: 2,
      group: "ChoiceQuiz",
      title: "一問一答で復習する",
      isCompleted: false,
      quizList: quizList,
    );

    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }

  ///○×クイズに追加
  void addTrueFalseQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;

    //同じクイズの時
    if (quizList.any((x) => x.question == quiz.question)) {
      return;
    }

    quizList.add(quiz);

    reviewItem[2] = QuizItem(
      id: 3,
      group: "TrueFalseQuiz",
      title: "○×問題で復習する",
      isCompleted: false,
      quizList: quizList,
    );

    print(reviewItem[2].quizList.length);

    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }

  ///○×クイズから削除
  void removeTrueFalseQuiz(Quiz quiz) {
    final quizList = [...state.quizList];
    final reviewItem = state.reviewItem;
    quizList.remove(quizList.where((x) => x.question == quiz.question).first);

    //○×問題から削除
    reviewItem[2] = QuizItem(
      id: 3,
      group: "TrueFalseQuiz",
      title: "○×問題で復習する",
      isCompleted: false,
      quizList: quizList,
    );

    print(reviewItem[2].quizList.length);
    state = state.copyWith(quizList: quizList, reviewItem: reviewItem);
  }
}

const reviewLearnQuiz = QuizItem(
    id: 1,
    group: "LearnQuiz",
    title: "一問一答で復習する",
    isCompleted: false,
    quizList: []);

const reviewChoiceQuiz = QuizItem(
  id: 2,
  group: "ChoiceQuiz",
  title: "選択問題で復習する",
  isCompleted: false,
  quizList: [],
);

const reviewTrueFalseQuiz = QuizItem(
  id: 3,
  group: "TrueFalseQuiz",
  title: "○×問題で復習する",
  isCompleted: false,
  quizList: [],
);
