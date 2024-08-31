part of '../quiz_result_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("結果"),
      actions: [
        ClearButton(
            iconSize: 30,
            onPressed: () {
              ref.read(homeStudyScreenProvider.notifier).setIsResultView(false);
              Navigator.of(context).pop();
            }),
        Gap(context.width * 0.02),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
