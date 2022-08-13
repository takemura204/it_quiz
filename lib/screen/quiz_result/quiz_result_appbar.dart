part of 'quiz_result_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.arguments);

  final QuizResultScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("結果"),
      actions: [
        Container(
          height: context.height * 0.05,
          alignment: Alignment.bottomRight,
          child: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            iconSize: 30,
            onPressed: () {
              //2つ前の画面に戻る
              int count = 0;
              Navigator.popUntil(context, (route) => count++ >= 2);

              //問題リセット
              ref
                  .read(quizRememberScreenControllerProvider.notifier)
                  .tapClearButton();
            },
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}