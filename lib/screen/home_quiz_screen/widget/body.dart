part of '../home_quiz_screen.dart';

class _Body extends ConsumerWidget {
  const _Body({required this.categoryList, required this.tabController});

  final List<String> categoryList;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final randomQuiz = state.randomQuiz ?? initRandomQuiz;
    final weakQuiz = state.weakQuiz ?? initWeakQuiz;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        TabBarView(
          controller: tabController,
          children: categoryList.map((category) => _QuizList(category: category)).toList(),
        ),
        _Fotter(
          weakQuiz: weakQuiz,
          randomQuiz: randomQuiz,
        ),
      ],
    );
  }
}
