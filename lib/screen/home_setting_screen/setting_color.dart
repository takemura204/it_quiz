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
        height: context.width * 0.05,
        width: context.width * 0.05,
        margin: EdgeInsets.all(context.width * 0.01),
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
