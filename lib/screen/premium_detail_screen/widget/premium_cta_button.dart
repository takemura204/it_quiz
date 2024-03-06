part of '../premium_detail_screen.dart';

///注意事項
class _CtaButton extends StatelessWidget {
  const _CtaButton();

  @override
  Widget build(BuildContext context) {
    final platformStoreName = kIsWeb
        ? 'ウェブストア'
        : Platform.isIOS
            ? 'Apple ID'
            : 'Google Playアカウント';

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
            text: 'いますぐ購入 ¥980(税込)',
            onPressed: () {
              print('購入モーダル表示');
            },
          ),
        ),
      ],
    );
  }
}
