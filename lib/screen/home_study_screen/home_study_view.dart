part of 'home_study_screen.dart';

///問題一覧Bar
class _QuizItemBar extends ConsumerWidget {
  const _QuizItemBar({required this.item, required this.index});
  final QuizItemState item;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(quizItemProvider)[index];
    final quizItemController = ref.read(quizItemProvider.notifier);
    return GestureDetector(
      onTap: () {
        quizItemController.tapQuizItemBar(index);
        //ダイアログ表示
        showDialog(
            context: context,
            builder: (_) => _SelectQuizDialog(item: item, index: index));
      },
      child: Card(
        elevation: 1.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
        child: Container(
          child: ListTile(
            contentPadding: const EdgeInsets.only(
                left: 10.0, top: 1.0, bottom: 1.0, right: 5),
            title: Text(
              item.title,
              style: const TextStyle(fontSize: 16),
            ),
            leading: item.isCompleted
                ? Icon(
                    Icons.pets,
                    color: context.colors.main50.withOpacity(0.6),
                  )
                : const Icon(
                    Icons.pets,
                  ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

class _SelectQuizDialog extends ConsumerWidget {
  const _SelectQuizDialog({required this.item, required this.index});
  final QuizItemState item;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.all(4),
      contentPadding: const EdgeInsets.all(4),
      children: [
        Container(
          height: context.height * 0.26,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                children: [
                  _Title(item),
                  const Spacer(),
                  ClearButton(
                    iconSize: context.height * 0.04,
                    onPressed: () {},
                  ),
                ],
              ),

              Divider(height: 1, color: context.colors.dark54),

              ///クイズ挑戦結果
              _QuizResult(item),

              Divider(height: 1, color: context.colors.dark54),

              ///クイズ形式選択
              Container(
                // color: Colors.redAccent,
                height: context.height * 0.15,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),

                    ///一問一答形式で学習する
                    _SimpleDialogOption1(
                        item: item, index: 0, text: I18n().styleLeanQuiz),

                    ///4択形式クイズに挑戦する
                    _SimpleDialogOption2(
                        item: item, index: 0, text: I18n().styleChoiceQuiz),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        item.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Text(
            "前回のクイズ挑戦結果",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            children: [
              ///正解数
              Text(
                item.score.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///問題数
              Text(
                "/" + item.quizList.length.toString(),
                style: const TextStyle(
                  fontSize: 16,
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

///クイズ選択ボタン1
class _SimpleDialogOption1 extends ConsumerWidget {
  const _SimpleDialogOption1(
      {required this.item, required this.index, required this.text});
  final QuizItemState item;
  final int index;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialogOption(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: context.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.onMain50.withOpacity(0.6),
          border: Border.all(color: context.colors.main50.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      onPressed: () => context.showScreen(
        QuizLearnScreenArguments(
          item: item,
        ).generateRoute(),
      ),
    );
  }
}

///クイズ選択ボタン2
class _SimpleDialogOption2 extends ConsumerWidget {
  const _SimpleDialogOption2(
      {required this.item, required this.index, required this.text});
  final QuizItemState item;
  final int index;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialogOption(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: context.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.main50.withOpacity(0.6),
          border: Border.all(color: context.colors.main50.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: context.colors.onMain50,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      onPressed: () => context.showScreen(
        QuizChoiceScreenArguments(
          item: item,
        ).generateRoute(),
      ),
    );
  }
}
