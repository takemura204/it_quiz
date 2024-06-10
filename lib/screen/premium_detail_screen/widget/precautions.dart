part of '../premium_detail_screen.dart';

///注意事項
class _Precautions extends HookConsumerWidget {
  const _Precautions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platformStoreName = kIsWeb
        ? 'ウェブストア'
        : Platform.isIOS
            ? 'Apple ID'
            : 'Google Playアカウント';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '購入済みの方はこちら',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ref
                          .read(premiumDetailProvider.notifier)
                          .restorePurchase();
                      print('復元');
                    }),
            ])),
          ),
          const Gap(30),
          const Text(
            '【購入するにあたっての注意事項】',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black54, fontSize: 14),
              children: [
                TextSpan(
                  text: '・本アプリ内での購入は、お使いの$platformStoreNameに請求されます。\n',
                ),
                const TextSpan(
                  text: '・購入手続きを完了した場合、',
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await launchUrl(Uri.parse(I18n().termsUrl));
                    },
                  text: '利用規約',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: context.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: '・',
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await launchUrl(Uri.parse(I18n().privacyPolicyUrl));
                    },
                  text: 'プライバシーポリシー',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: context.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: 'を同意したこととみなし、お支払いが処理されます。\n',
                ),
                TextSpan(
                  text:
                      '・機種変更などで同じ$platformStoreNameからインストールして、プレミアムが反映されない場合は、"購入済みの方はこちら"のボタンをタップしてください。\n',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
