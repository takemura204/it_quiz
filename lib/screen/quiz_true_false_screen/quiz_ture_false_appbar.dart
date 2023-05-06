part of 'quiz_true_false_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.arguments);

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(arguments.item.title),
      leading: CustomBackButton(
        onPressed: () => ref
            .read(quizTureFalseScreenControllerProvider.notifier)
            .tapClearButton(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
