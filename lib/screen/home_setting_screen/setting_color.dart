part of 'home_setting_screen.dart';

///カラーテーマ
class _SettingThemeColor extends ConsumerWidget {
  const _SettingThemeColor();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "カラーテーマ",
      icon: LineIcons.palette,
      customWidget: Container(
        height: 23,
        width: 23,
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: context.mainColor,
        ),
      ),
      onTap: () {
        context.showScreen(const SettingColorScreenArguments().generateRoute());
      },
    );
  }
}
