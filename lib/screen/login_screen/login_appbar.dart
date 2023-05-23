part of 'login_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("ログイン"),
      leading: CustomBackButton(onPressed: () {
        Navigator.pop(context);
      }
          // => ref.read(authScreenControllerProvider.notifier).reset(),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
