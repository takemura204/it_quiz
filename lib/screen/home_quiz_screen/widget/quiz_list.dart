part of '../home_quiz_screen.dart';

class _QuizList extends ConsumerWidget {
  const _QuizList({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final quizList = state.quizList.where((x) => x.category == category).toList();

    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        ///前回の続きから
        SliverToBoxAdapter(child: _LastActionButton(category: category)),

        ///クイズ一覧
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final quiz = quizList[index];
              return _QuizCard(
                quiz: quiz,
                index: index,
              );
            },
            childCount: quizList.length,
          ),
        ),
        const SliverToBoxAdapter(child: Gap(80)),
      ],
    );
  }
}

class _LastActionButton extends ConsumerWidget {
  const _LastActionButton({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final quizList = state.quizList.where((x) => x.category == category).toList();
    final historyQuizList = state.historyQuizList.where((x) => x.category == category).toList();

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: context.width * 0.02,
          right: context.width * 0.02,
          top: context.width * 0.05,
          bottom: context.width * 0.02),
      child: historyQuizList.isNotEmpty
          ? AnimatedShadowButton(
              width: context.width,
              height: 65,
              title: "前回の続きから",
              subtitle: '${historyQuizList.last.title}',
              onPressed: () {
                final lastQuizId = historyQuizList.last.id;
                final index = quizList.indexWhere((quiz) => quiz.id == lastQuizId);

                if (index != -1) {
                  final quiz = quizList[index];
                  ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.study);
                  ref.read(quizModelProvider.notifier).setQuizIndex(index);
                  ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);

                  showQuizModal(context, quiz.quizItemList);
                }
              },
            )
          : AnimatedShadowButton(
              width: context.width,
              height: 65,
              title: "はじめる",
              subtitle: '${quizList.first.title}',
              onPressed: () {
                final quiz = quizList.first;
                ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.study);
                ref.read(quizModelProvider.notifier).setQuizIndex(0);
                ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
                showQuizModal(context, quiz.quizItemList);
              },
            ),
    );
  }
}
