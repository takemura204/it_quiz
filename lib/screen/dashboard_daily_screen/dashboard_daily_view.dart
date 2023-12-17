part of 'dashboard_daily_screen.dart';

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subWidget, required this.icon});

  final String title;
  final Widget? subWidget;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
        bottom: 0.00,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: context.mainColor, width: context.width * 0.003),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.023,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (subWidget != null) ...[
            subWidget!,
          ],
        ],
      ),
    );
  }
}

class _DailyQuizCount extends ConsumerWidget {
  const _DailyQuizCount({required this.score});

  final int score;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.45,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                LineIcons.book,
                color: Colors.black54,
                size: context.height * 0.03,
              ),
              Text(
                '問題数',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.mainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                height: context.height * 0.008,
                width: ('$score'.length.toDouble()) * context.height * 0.022 +
                    context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$score",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '問',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: context.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DailyDuration extends ConsumerWidget {
  const _DailyDuration({required this.score});

  final int score;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.45,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                LineIcons.clock,
                color: Colors.black54,
                size: context.height * 0.03,
              ),
              Text(
                '学習時間',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.mainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                height: context.height * 0.008,
                width: ('$score'.length.toDouble()) * context.height * 0.022 +
                    context.height * 0.02,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "$score",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '分',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DailyLogin extends ConsumerWidget {
  const _DailyLogin({required this.score});

  final int score;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.45,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                LineIcons.calendar,
                color: Colors.black54,
                size: context.height * 0.03,
              ),
              Text(
                '学習日数',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.mainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                height: context.height * 0.008,
                width: ('$score'.length.toDouble()) * context.height * 0.022 +
                    context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$score",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '日',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
