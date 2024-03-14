part of 'dashboard_daily_screen.dart';

class _Title extends ConsumerWidget {
  const _Title({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
        bottom: 0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(5),
          Text(
            title,
            style: context.texts.titleMedium,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _DailyData extends ConsumerWidget {
  const _DailyData(
      {required this.title,
      required this.icon,
      required this.score,
      required this.unit});

  final String title;
  final IconData icon;
  final int score;
  final String unit;

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
                icon,
                color: Colors.black54,
                size: 25,
              ),
              Text('$title', style: context.texts.titleSmall),
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.mainColor.withOpacity(0.75),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                height: 8,
                width: ('$score'.length.toDouble()) * 18 + 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$score",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(1),
                  Text(
                    '$unit',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
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
