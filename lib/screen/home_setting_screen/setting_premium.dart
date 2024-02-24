part of 'home_setting_screen.dart';

///プロフィール
class _SettingPremium extends ConsumerWidget {
  const _SettingPremium();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "追加購入",
      icon: LineIcons.shoppingCart,
      customWidget: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "未購入",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
      onTap: () {
        context
            .showScreen(const SettingProfileScreenArguments().generateRoute());
      },
    );
  }
}
