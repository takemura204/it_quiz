import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button/primary_button.dart';

import '../../view/button/circle_button.dart';

part 'premium_detail_view.dart';

class PremiumDetailScreen extends ConsumerWidget {
  const PremiumDetailScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ///バツボタン
                Container(
                  color: Colors.blue,
                  padding:
                      const EdgeInsets.only(top: 50, right: 20, bottom: 10),
                  alignment: Alignment.centerRight,
                  child: CircleButton(
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                      color: Colors.white,
                    ),
                    size: const Size(40, 40),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                Container(
                  color: context.mainColor,
                  height: 300,
                  width: context.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'プレミアムでIT用語を\nもっと快適に学ぼう！',
                          style: TextStyle(fontSize: 27),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),

                ///プレミアムコンテンツ１
                _PremiumContent(
                  index: 1,
                  title: TextSpan(
                    children: [
                      TextSpan(
                        text: '850',
                        style: TextStyle(
                          color: context.accentColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: '以上の用語・クイズを解放！',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  titleLength: 255,
                  description: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'ITパスポート',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'に対応した用語を学べるため、',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '資格勉強',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'だけでなく、',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '職場のコミュニケーション',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'などでも幅広く役立ちます。',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  image: 'assets/image/premium_content1.png',
                ),
                const Gap(20),
                _PremiumContent(
                  index: 2,
                  title: TextSpan(
                    children: [
                      TextSpan(
                        text: '広告',
                        style: TextStyle(
                          color: context.accentColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'が非表示！',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  titleLength: 135,
                  description: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'クイズ画面や結果画面などで表示される広告が表示されないので、',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '気軽に、集中して学ぶ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'ことができます。',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  image: 'assets/image/premium_content2.png',
                ),
                const Gap(20),
                _PremiumContent(
                  index: 3,
                  title: TextSpan(
                    children: [
                      TextSpan(
                        text: '学習状況',
                        style: TextStyle(
                          color: context.accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'を見える化！',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  titleLength: 200,
                  description: const TextSpan(
                    children: [
                      TextSpan(
                        text: '毎週・毎月の学習状況が',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '可視化',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'されるので、目標に着実に進んでいることを確認でき、',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '継続率UP',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'につながります。',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  image: 'assets/image/premium_content3.png',
                ),
                const Gap(20),
                _PremiumContent(
                  index: 4,
                  title: TextSpan(
                    children: [
                      TextSpan(
                        text: '進捗状況',
                        style: TextStyle(
                          color: context.accentColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'を簡単に把握！',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  titleLength: 220,
                  description: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'レーダーチャートから、強みと弱みが',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '一目',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'でわかり、学習進捗の全体像を',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: '簡単',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'に把握できます。',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  image: 'assets/image/premium_content4.png',
                ),
                const Gap(20),
                _PremiumContent2(
                  index: 5,
                  title: TextSpan(
                    children: [
                      TextSpan(
                        text: '便利な学習機能',
                        style: TextStyle(
                          color: context.accentColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'を追加！',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  titleLength: 250,
                ),
                const Gap(120),
              ],
            ),
          ),

          ///購入ボタン
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: context.backgroundColor,
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 40),
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
          ),
        ],
      ),
    );
  }
}
