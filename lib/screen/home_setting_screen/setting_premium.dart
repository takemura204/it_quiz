part of 'home_setting_screen.dart';

///プロフィール
class _SettingPremium extends ConsumerWidget {
  const _SettingPremium();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(userModelProvider.select((x) => x.isPremium));
    return CustomSettingBar(
      title: "追加購入",
      icon: LineIcons.shoppingCart,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isPremium ? '購入済み' : "未購入",
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
      onTap: () {
        context
            .showScreen(const PremiumDetailScreenArguments().generateRoute());
      },
    );
  }
}
