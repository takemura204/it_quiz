part of 'home_setting_screen.dart';

///リマインダー
class _SettingContact extends ConsumerWidget {
  const _SettingContact();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "お問い合わせ",
      icon: LineIcons.telegramPlane,
      customWidget: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () async {
        context
            .showScreen(const SettingContactScreenArguments().generateRoute());
      },
    );
  }
}
