part of 'quiz_learn_result_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(item.group),
      actions: [
        ClearButton(
          iconSize: 30,
          onPressed: () => //問題リセット
              ref
                  .read(quizLearnScreenControllerProvider.notifier)
                  .tapClearButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
