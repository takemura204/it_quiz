part of '../premium_detail_screen.dart';

///購入ボタン
class _CtaButton extends HookConsumerWidget {
  const _CtaButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((x) => x.isPremium));

    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            '＼　お支払いは１度きり！　／',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          const Gap(10),
          Container(
            child: isPremium
                ? PrimaryButton(
                    width: context.width,
                    height: 60,
                    title: '購入済み',
                    onPressed: null,
                  )
                : AnimatedShadowButton(
                    width: context.width,
                    height: 60,
                    title: 'いますぐ購入 ¥980(税込)',
                    onPressed: () {
                      ref.read(premiumDetailProvider.notifier).buyPurchase980();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
