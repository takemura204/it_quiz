part of '../premium_detail_screen.dart';

class _PremiumContentList extends StatelessWidget {
  const _PremiumContentList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "＼　特典たくさん　／",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
        ),
        const Gap(1),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.mainColor.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              height: 8,
              width: 275,
            ),
            const Text(
              'プレミアムでできること',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87),
            ),
          ],
        ),

        const Gap(30),

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
          image: 'assets/image/premium/premium_content1.png',
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
          image: 'assets/image/premium/premium_content2.png',
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
                text: 'が見える化！',
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
          image: 'assets/image/premium/premium_content3.png',
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
          image: 'assets/image/premium/premium_content4.png',
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
                text: 'をたくさん追加！',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          titleLength: 310,
        ),
        const Gap(5),
        const _PremiumContentSoon(),
      ],
    );
  }
}
