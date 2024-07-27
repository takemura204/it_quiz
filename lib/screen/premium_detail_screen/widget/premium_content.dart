part of '../premium_detail_screen.dart';

///スライド画面
class _PremiumContent extends StatelessWidget {
  const _PremiumContent(
      {required this.index,
      required this.title,
      required this.titleLength,
      required this.description,
      required this.image});

  final int index;
  final InlineSpan title;
  final double titleLength;
  final InlineSpan description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.mainColor, width: 1),
            ),
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(35),

                ///タイトル
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.mainColor.withOpacity(0.6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      height: 8,
                      width: titleLength,
                    ),
                    RichText(textAlign: TextAlign.center, text: title),
                  ],
                ),

                const Gap(15),

                ///説明
                RichText(textAlign: TextAlign.start, text: description),

                const Gap(15),
                Container(
                  width: context.width,
                ),
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                  width: context.width,
                ),
                const Gap(20),
              ],
            ),
          ),

          ///丸番号
          Positioned(
            top: 0,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: context.mainColor,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumContent2 extends StatelessWidget {
  const _PremiumContent2({
    required this.index,
    required this.title,
    required this.titleLength,
  });

  final int index;
  final InlineSpan title;
  final double titleLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 24, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.mainColor, width: 1),
            ),
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(35),

                ///タイトル
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.mainColor.withOpacity(0.6),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      height: 8,
                      width: titleLength,
                    ),
                    RichText(textAlign: TextAlign.center, text: title),
                  ],
                ),

                const Gap(30),

                /// スキップ機能
                Row(
                  children: [
                    Image.asset(
                      'assets/image/premium/premium_content5_1.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                    const Gap(10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'わからない問題をスキップ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black87),
                          ),
                          Gap(5),
                          Text(
                            'わからない問題をスキップすることで、苦手を把握しやすくなります。',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(20),

                Row(
                  children: [
                    Image.asset(
                      'assets/image/premium/premium_content5_2.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                    const Gap(10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '用語の検索・解説を全て閲覧',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black87),
                          ),
                          Gap(5),
                          Text(
                            '苦手な用語や保存したい用語をすぐ見返したい時に探しやすくなります。',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Gap(20),

                Row(
                  children: [
                    Image.asset(
                      'assets/image/premium/premium_content5_3.png',
                      fit: BoxFit.fill,
                      width: 60,
                    ),
                    const Gap(10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'カラーテーマを変更',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black87),
                          ),
                          Gap(5),
                          Text(
                            '９種類のテーマを変更できることで、自分好みにカスタマイズが可能です。',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Gap(20),
              ],
            ),
          ),

          ///丸番号
          Positioned(
            top: 0,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: context.mainColor,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumContentSoon extends StatelessWidget {
  const _PremiumContentSoon();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: context.width,
        margin: const EdgeInsets.only(top: 24, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: context.mainColor, width: 1),
        ),
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(15),

            ///タイトル
            Text(
              'Coming soon...',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87),
            ),

            Gap(10),

            Text(
              '今後も様々なプレミアム機能を追加予定です！',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  color: Colors.black87),
            ),

            Gap(15),
          ],
        ),
      ),
    );
  }
}
