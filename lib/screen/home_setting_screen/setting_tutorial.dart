part of 'home_setting_screen.dart';

///リマインダー
class _SettingTutorial extends ConsumerWidget {
  const _SettingTutorial();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "チュートリアル",
      icon: LineIcons.playCircle,
      customWidget: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () async {
        ref
            .read(tutorialControllerProvider.notifier)
            .setIsTutorialRestart(true);
      },
    );
  }
}
