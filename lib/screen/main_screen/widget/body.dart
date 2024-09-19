

part of '../main_screen.dart';
class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.select((s) => s.quizList));
    if (quizList.isEmpty) {
      return LaunchScreen();
    }
    final currentTabIndex =
    ref.watch(mainScreenControllerProvider.select((s) => s.currentTabIndex));

    return IndexedStack(
      sizing: StackFit.expand,
      index: currentTabIndex,
      children: const [
        HomeStudyScreen(),
        HomeQuizScreen(),
        HomeSearchScreen(),
        HomeDashboardScreen(),
        HomeSettingScreen(),
      ],
    );
  }
}