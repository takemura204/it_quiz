part of '../quiz_result_screen.dart';

class NextActionButtons extends HookConsumerWidget {
  const NextActionButtons(this.quizItemList);

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider.select((s) => s.studyType));
    Widget actionButtonsWidget(StudyType studyType) {
      switch (studyType) {
        case StudyType.study:
          return const _StudyActionButtons();
        case StudyType.learn:
          return const _LearnActionButtons();
        case StudyType.choice:
          return const _ChoiceActionButtons();
        default:
          return const Gap(0);
      }
    }

    return Container(
      color: context.backgroundColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      width: context.width,
      child: actionButtonsWidget(studyType),
    );
  }
}

class _StudyActionButtons extends HookConsumerWidget {
  const _StudyActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(homeStudyScreenProvider.select((s) => s.isResultScreen));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(10),
        Expanded(
          child: DefaultVerticalButton(
            width: context.width * 0.45,
            height: 85,
            text: "もう一度",
            iconWidget: Icon(
              LineIcons.alternateRedo,
              color: context.mainColor,
              size: 40,
            ),
            onPressed: () async {
              ref.read(homeStudyScreenProvider.notifier).restartStudyQuiz();
              if (isResultScreen) {
                ref.read(homeStudyScreenProvider.notifier).setIsResultScreen(false);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        const Gap(10),
        Expanded(
          child: PrimaryVerticalButton(
            width: context.width * 0.45,
            height: 85,
            title: "条件を変更",
            iconWidget: const Icon(
              LineIcons.horizontalSliders,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              showStudyModal(context);
            },
          ),
        ),
        const Gap(10),
      ],
    );
  }
}

class _LearnActionButtons extends HookConsumerWidget {
  const _LearnActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectQuiz = ref.watch(homeQuizScreenProvider.select((s) => s.selectQuiz));
    final quizItemList = ref.watch(quizLearnScreenProvider.select((s) => s.quizItemList));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(10),
        Expanded(
          child: DefaultVerticalButton(
            width: context.width * 0.45,
            height: 85,
            text: "もう一度",
            iconWidget: Icon(
              LineIcons.alternateRedo,
              color: context.mainColor,
              size: 40,
            ),
            onPressed: () async {
              ref.read(quizLearnScreenProvider.notifier).restartLearnQuiz();
            },
          ),
        ),
        const Gap(10),
        Expanded(
          child: PrimaryVerticalButton(
            width: context.width * 0.45,
            height: 85,
            title: "クイズに挑戦",
            iconWidget: SvgPicture.asset(
              'assets/icon/list.svg',
              width: 40,
              height: 40,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              context.showScreen(QuizChoiceScreenArguments(
                quiz: selectQuiz!.copyWith(quizItemList: quizItemList),
              ).generateRoute());
            },
          ),
        ),
        const Gap(10),
      ],
    );
  }
}

class _ChoiceActionButtons extends HookConsumerWidget {
  const _ChoiceActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(homeStudyScreenProvider.select((s) => s.isResultScreen));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(10),
        Expanded(
          child: DefaultVerticalButton(
            width: context.width * 0.45,
            height: 85,
            text: "もう一度",
            iconWidget: Icon(
              LineIcons.alternateRedo,
              color: context.mainColor,
              size: 40,
            ),
            onPressed: () async {
              ref.read(homeStudyScreenProvider.notifier).restartStudyQuiz();
              if (isResultScreen) {
                ref.read(homeStudyScreenProvider.notifier).setIsResultScreen(false);
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        const Gap(10),
        Expanded(
          child: PrimaryVerticalButton(
            width: context.width * 0.45,
            height: 85,
            title: "条件を変更",
            iconWidget: const Icon(
              LineIcons.horizontalSliders,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {},
          ),
        ),
        const Gap(10),
      ],
    );
  }
}
