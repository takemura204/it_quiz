import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../../screen/screen_argument.dart';
import 'need_premium_modal.dart';

Future showPremiumQuizModal(BuildContext context) async {
  showDialog(context: context, builder: (_) => const PremiumQuizModal());
}

///プレミアム購入完了モーダル
class PremiumQuizModal extends HookConsumerWidget {
  const PremiumQuizModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeedPremiumModal(
      title: '用語・クイズを解放しますか？',
      imagePath: 'assets/image/premium/premium_content1.png',
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
                    text: '850',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.accentColor,
                      fontSize: 20,
                    ),
                  ),
                  const TextSpan(
                    text: '以上の用語・クイズが',
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
                    text: '解放されます。',
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
