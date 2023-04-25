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
            margin: const EdgeInsets.all(20),
            child: Container(
              height: context.height * 0.12,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
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
  const _QuizButton(
      {required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTap});
  final String title;
  final String subTitle;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.all(20),
          child: Container(
            height: context.height * 0.12,
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.onMain50,
              border: Border.all(
                color: context.colors.main50.withOpacity(0.7),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Icon(
                      icon,
                      size: context.width * 0.1,
                    ),
                    const Gap(10),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.width * 0.05,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Gap(5),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: context.width * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
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

class _QuizResult extends ConsumerWidget {
  const _QuizResult(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "前回のクイズ挑戦結果",
            style: TextStyle(
                fontSize: context.width * 0.04, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            children: [
              ///正解数
              Text(
                "${item.score}",
                style: TextStyle(
                  fontSize: context.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///問題数
              Text(
                "点",
                style: TextStyle(
                  fontSize: context.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
        ref.watch(homeReviewScreenProvider).groupList.contains(text);
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
          border: Border.all(
              width: isSelected ? 1 : 0.5,
              color: isSelected
                  ? context.colors.main50.withOpacity(0.6)
                  : Colors.black45),
          color: isSelected
              ? context.colors.main20.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
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
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: context.width * 0.03),
          ),
          const Gap(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Container(
              height: context.height * 0.05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(color: context.colors.main50.withOpacity(0.6)),
              ),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.normal),
                    unselectedLabelColor:
                        context.colors.main50.withOpacity(0.7),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: context.colors.main50.withOpacity(0.6)),
                    tabs: [
                      Tab(
                        child: Text(
                          "10問",
                          style: TextStyle(fontSize: context.width * 0.04),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("20問",
                              style: TextStyle(fontSize: context.width * 0.04)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("50問",
                              style: TextStyle(fontSize: context.width * 0.04)),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///クイズ選択ボタン
class _SimpleDialogOption extends ConsumerWidget {
  const _SimpleDialogOption({required this.item, required this.text});
  final QuizItemState item;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGroup = ref.watch(homeReviewScreenProvider).groupList.isNotEmpty;
    return SimpleDialogOption(
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
        onPressed: isGroup
            ? () {
                ref.read(quizItemProvider.notifier).setQuizType(QuizType.test);
                context.showScreen(
                  QuizChoiceScreenArguments(
                    item: item,
                  ).generateRoute(),
                );
              }
            : null);
  }
}
