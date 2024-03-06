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
                size: 25,
                color: Colors.grey,
              ),
              size: const Size(40, 40),
              onTap: () {
                Navigator.of(context).pop();
              },
              color: Colors.grey.shade300.withOpacity(0.5),
            ),
          ),

          Container(
            height: 360,
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
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const Text(
                            'IT用語をもっと深く、',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: context.mainColor.withOpacity(0.7),
                          //     borderRadius:
                          //         const BorderRadius.all(Radius.circular(8)),
                          //   ),
                          //   height: 8,
                          //   width: 275,
                          // ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const Text(
                            '快適に学ぼう！',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: context.mainColor.withOpacity(0.7),
                          //     borderRadius:
                          //         const BorderRadius.all(Radius.circular(8)),
                          //   ),
                          //   height: 8,
                          //   width: 190,
                          // ),
                        ],
                      ),
                      const Gap(15),
                      Image.asset(
                        'assets/image/premium_header.png',
                        fit: BoxFit.fill,
                        width: context.width * 0.75,
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
