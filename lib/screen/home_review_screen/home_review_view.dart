part of 'home_review_screen.dart';

///タップできないボタン
class _NullQuizButton extends ConsumerWidget {
  const _NullQuizButton({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: null,
          child: Card(
            elevation: 2,
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(20),
            child: Container(
              height: context.height * 0.15,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: context.width * 0.05,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///クイズボタン
class _QuizButton extends ConsumerWidget {
  const _QuizButton({
    required this.title,
    required this.subWidget,
    required this.icon,
    required this.onTap,
    required this.score,
    required this.unit,
  });

  final String title;
  final Widget subWidget;
  final int score;
  final String unit;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.mainColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: context.width * 0.03, vertical: context.width * 0.03),
          child: Container(
            height: context.height * 0.13,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    ///アイコン
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.03),
                      child: Icon(
                        icon,
                        size: context.width * 0.14,
                        color: context.mainColor,
                      ),
                    ),
                    Gap(context.height * 0.01),

                    ///タイトル
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(context.height * 0.01),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: context.width * 0.05,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(context.height * 0.01),
                        subWidget,
                      ],
                    ),
                    const Spacer(),

                    ///スコア
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: context.width * 0.15,
                            height: context.width * 0.15,
                            decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: CircleBorder(
                                    side: BorderSide(
                                  width: 3,
                                  color: context.mainColor,
                                ))),
                            alignment: Alignment.center,
                            child: Text(
                              score.toString(),
                              style: TextStyle(
                                fontSize: context.width * 0.05,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: context.width * 0.15,
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(
                              left: context.width * 0.01,
                              right: context.width * 0.03,
                              bottom: context.width * 0.06,
                            ),
                            child: Text(
                              unit,
                              style: TextStyle(
                                fontSize: context.width * 0.04,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
