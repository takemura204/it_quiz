part of '../premium_detail_screen.dart';

///購入ボタン
class _CtaButton extends HookConsumerWidget {
  const _CtaButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(userModelProvider.select((x) => x.isPremium));

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: context.backgroundColor,
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
          child: PrimaryButton(
            width: context.width,
            height: 60,
            text: isPremium ? '購入済み' : 'いますぐ購入 ¥980(税込)',
            onPressed: isPremium
                ? null
                : () {
                    ref.read(userModelProvider.notifier).updateIsPremium(true);
                    print('購入プロセスを開始');
                  },
          ),
        ),
        // Container(
        //   color: context.backgroundColor,
        //   padding:
        //       const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 35),
        //   child: PrimaryButton(
        //     width: context.width,
        //     height: 60,
        //     text: 'Coming Soon...',
        //     onPressed: null,
        //   ),
        // ),
      ],
    );
  }
}
