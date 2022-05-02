part of 'home_root_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch<HomeRootScreenState>(homeRootScreenControllerProvider);

    return IndexedStack(
      sizing: StackFit.expand,
      index: state.currentIndex,
      children: const [
        HomeStudyScreen(),
        HomeReviewScreen(),
        HomeTestScreen(),
        HomeSettingScreen(),
      ],
    );
  }
}
