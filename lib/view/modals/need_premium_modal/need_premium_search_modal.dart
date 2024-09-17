import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../../screen/screen_argument.dart';
import 'need_premium_modal.dart';

Future showNeedPremiumQuizModal(BuildContext context) async {
  showDialog(context: context, builder: (_) => const PremiumSearchModal());
}

///プレミアム購入完了モーダル
class PremiumSearchModal extends HookConsumerWidget {
  const PremiumSearchModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeedPremiumModal(
      title: '検索用語を全て解放しますか？',
      imagePath: 'assets/image/premium/premium_8.svg',
      subWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.black87),
                children: [
                  const TextSpan(
                    text: 'プレミアム特典を購入すると、\n',
                  ),
                  TextSpan(
                    text: '全て',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.accentColor,
                      fontSize: 18,
                    ),
                  ),
                  const TextSpan(
                    text: 'のIT用語を',
                  ),
                  TextSpan(
                    text: '検索・保存',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.accentColor,
                      fontSize: 18,
                    ),
                  ),
                  const TextSpan(
                    text: 'できます。',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
        context.showScreen(const PremiumDetailScreenArguments().generateRoute());
      },
    );
  }
}
