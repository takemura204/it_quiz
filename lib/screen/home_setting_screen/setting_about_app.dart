part of 'home_setting_screen.dart';

///レビュー
class _SettingAboutApp extends ConsumerWidget {
  const _SettingAboutApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "このアプリについて",
      icon: LineIcons.infoCircle,
      customWidget: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () async {
        context
            .showScreen(const SettingAboutAppScreenArguments().generateRoute());
      },
    );
  }
}
