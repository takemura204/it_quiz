part of '../premium_detail_screen.dart';

///購入ボタン
class _CtaButton extends HookConsumerWidget {
  const _CtaButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((x) => x.isPremium));

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: context.backgroundColor,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
          child: isPremium
              ? PrimaryButton(
                  width: context.width,
                  height: 60,
                  text: '購入済み',
                  onPressed: null,
                )
              : AnimatedShadowButton(
                  width: context.width,
                  height: 60,
                  text: 'いますぐ購入 ¥980(税込)',
                  onPressed: () {
                    ref.read(premiumDetailProvider.notifier).buyPurchase980();
                  },
                ),
        ),
      ],
    );
  }
}
