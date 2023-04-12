part of 'quiz_choice_screen.dart';

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
      leading: CustomBackButton(
        iconSize: 25,
        onPressed: () =>
            ref.read(quizChoiceScreenProvider.notifier).tapClearButton(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
