part of '../premium_detail_screen.dart';

///スライド画面
class _PremiumHeader extends StatelessWidget {
  const _PremiumHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ///バツボタン
          Container(
            padding: const EdgeInsets.only(top: 50, right: 20),
            alignment: Alignment.centerRight,
            child: CircleButton(
              icon: const Icon(
                Icons.close,
                size: 30,
                color: Colors.grey,
              ),
              size: const Size(45, 45),
              onTap: () {
                Navigator.of(context).pop();
              },
              color: Colors.grey.shade300.withOpacity(0.5),
            ),
          ),

          Container(
            width: context.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                ///ラベル
                Container(
                  color: context.accentColor,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'PREMIUM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Gap(15),

                ///タイトル
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Text(
                            'IT用語をもっと深く、',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Text(
                            '快適に学ぼう！',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const Gap(15),
                      Image.asset(
                        'assets/image/premium/premium_header.png',
                        fit: BoxFit.fill,
                        width: context.width * 0.75,
                      ),
                      const Gap(15),
                      const Text(
                        '※支払いは一度きりです。',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Gap(15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
