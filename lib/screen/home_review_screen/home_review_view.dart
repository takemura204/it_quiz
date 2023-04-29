part of 'home_review_screen.dart';

///タップできないボタン
class _NullQuizButton extends ConsumerWidget {
  const _NullQuizButton({required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: null,
          child: Card(
            elevation: 2,
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(20),
            child: Container(
              height: context.height * 0.15,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: context.width * 0.05,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///クイズボタン
class _QuizButton extends ConsumerWidget {
  const _QuizButton({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
    required this.score,
    required this.unit,
  });
  final String title;
  final String subTitle;
  final int score;
  final String unit;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          color: context.colors.onMain50,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.colors.main50.withOpacity(0.6),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(20),
          child: Container(
            height: context.height * 0.13,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    ///アイコン
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.03),
                      child: Icon(
                        icon,
                        size: context.width * 0.14,
                        color: context.colors.main50.withOpacity(0.6),
                      ),
                    ),
                    const Gap(10),

                    ///タイトル
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: context.width * 0.05,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          subTitle,
                          style: TextStyle(
                            fontSize: context.width * 0.03,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    ///スコア
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: context.width * 0.15,
                            height: context.width * 0.15,
                            decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                  width: 3,
                                  color: context.colors.main50.withOpacity(0.5),
                                ))),
                            alignment: Alignment.center,
                            child: Text(
                              score.toString(),
                              style: TextStyle(
                                fontSize: context.width * 0.05,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: context.width * 0.15,
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(
                              left: context.width * 0.01,
                              right: context.width * 0.03,
                              bottom: context.width * 0.06,
                            ),
                            child: Text(
                              unit,
                              style: TextStyle(
                                fontSize: context.width * 0.04,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}

class _DialogTitle extends ConsumerWidget {
  const _DialogTitle(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.07,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(item.title,
              style: TextStyle(
                fontSize: context.width * 0.05,
                fontWeight: FontWeight.bold,
              )),
          Text(
            '「${item.title}」では全ての問題からランダムに出題します',
            style: TextStyle(
                fontSize: context.width * 0.025, fontWeight: FontWeight.normal),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _QuizRange extends ConsumerWidget {
  const _QuizRange();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupTitle =
        ref.read(quizItemProvider).map((item) => item.group).toSet().toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題範囲を選択してください。',
            style: TextStyle(fontSize: context.width * 0.03),
          ),
          const Gap(5),
          _SelectRange(groupTitle[0]),
          _SelectRange(groupTitle[1]),
          _SelectRange(groupTitle[2]),
          _SelectRange(groupTitle[3]),
        ],
      ),
    );
  }
}

class _SelectRange extends ConsumerWidget {
  const _SelectRange(this.text);
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected =
        ref.watch(homeReviewScreenProvider).testGroup.contains(text);
    return GestureDetector(
      onTap: () {
        ref.read(homeReviewScreenProvider.notifier).selectGroup(text);
      },
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.05,
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: isSelected ? 1 : 0.5,
            color: isSelected
                ? context.colors.main50.withOpacity(0.6)
                : Colors.black45,
          ),
          color: isSelected
              ? context.colors.main10.withOpacity(0.1)
              : Colors.grey.withOpacity(0.05),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle_outline : Icons.circle_outlined,
              color: isSelected
                  ? context.colors.main50.withOpacity(0.6)
                  : Colors.black54,
            ),
            const Gap(5),
            Text(
              text,
              style: TextStyle(
                fontSize: context.width * 0.04,
                color: isSelected
                    ? context.colors.main50.withOpacity(0.6)
                    : Colors.black54,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///問題数指定
class _SelectLength extends ConsumerWidget {
  const _SelectLength();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> testLength = [10, 20, 50];
    final selectedLength = ref.watch(
      homeReviewScreenProvider.select((state) => state.testLength),
    );
    final initialIndex = testLength.indexOf(selectedLength);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04, vertical: context.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: context.width * 0.03),
          ),
          const Gap(5),
          Container(
            height: context.height * 0.05,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: context.colors.main50.withOpacity(0.6)),
            ),
            child: DefaultTabController(
              length: 3,
              initialIndex: initialIndex,
              child: TabBar(
                  onTap: (index) {
                    ref
                        .read(homeReviewScreenProvider.notifier)
                        .selectLength(testLength[index]);
                  },
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: context.colors.main50.withOpacity(0.7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.colors.main50.withOpacity(0.6)),
                  tabs: [
                    Tab(
                      child: Text(
                        "${testLength[0]}問",
                        style: TextStyle(fontSize: context.width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[1]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[2]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

///クイズ選択ボタン
class _SimpleDialogOption extends ConsumerWidget {
  const _SimpleDialogOption({required this.text});
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGroup = ref.watch(homeReviewScreenProvider).testGroup.isNotEmpty;
    return SimpleDialogOption(
      onPressed: isGroup
          ? () async {
              ref.read(quizItemProvider.notifier).setQuizType(QuizType.test);
              await ref.read(homeReviewScreenProvider.notifier).addTestQuiz();
              final testQuiz = ref.read(homeReviewScreenProvider).testQuiz;
              context.showScreen(
                QuizChoiceScreenArguments(
                  item: testQuiz,
                ).generateRoute(),
              );
            }
          : null,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(0),
        child: Container(
          height: context.height * 0.06,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isGroup
                ? context.colors.main50.withOpacity(0.6)
                : Colors.black12,
            border: Border.all(
              color: isGroup
                  ? context.colors.main50.withOpacity(0.7)
                  : Colors.black12.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: AutoSizeText(
            text,
            style: TextStyle(
              color: isGroup ? context.colors.onMain50 : Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: context.width * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}
