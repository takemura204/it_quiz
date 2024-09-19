part of '../quiz_learn_screen.dart';


class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(quiz.title),
      leading: CustomBackButton(onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return PrimaryDialog(
                onPressed: () {
                  ref.read(quizLearnScreenProvider.notifier).tapClearButton();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                title: "学習を中断しますか？",
                subWidget: Text(
                  "学習を中断すると\nこれまでの内容は保存されません。",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: context.width * 0.04, color: Colors.black87),
                  maxLines: 2,
                ),
                cancelText: "続ける",
                doneText: "中断する",
              );
            });
      }),
      actions: const [
        ContactIconButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}