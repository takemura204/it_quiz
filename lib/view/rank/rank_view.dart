part of 'rank_widget.dart';

class _RankIcon extends ConsumerWidget {
  const _RankIcon({required this.rank});

  final Rank rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 50,
      width: 45,
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.identity()..scale(1.8, 0.6),
                alignment: Alignment.center,
                child: FaIcon(
                  FontAwesomeIcons.crown,
                  color: context.mainColor,
                  size: 11,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 26,
                child: Text(
                  "${rank.level}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: context.mainColor,
                  ),
                ),
              ),
              Container(
                height: 12,
                child: Text(
                  "RANK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: context.mainColor,
                  ),
                ),
              ),
              const Gap(3),
            ],
          ),
        ],
      ),
    );
  }
}

class _RankStatus extends ConsumerWidget {
  const _RankStatus({required this.rank});

  final Rank rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultRanks = ref.watch(rankModelProvider.notifier).defaultRanks;
    final totalScore = rank.score + defaultRanks[rank.rankId].score;
    return Container(
      height: 40,
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(3),
              Text(
                "${totalScore * 10}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Gap(1),
              Text(
                "pt",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          const Gap(4),
          ProgressLineBar(
            height: 8,
            width: 100,
            currentScore: rank.score % rank.levelUpScore,
            goalScore: rank.levelUpScore,
            isUnit: false,
            borderRadius: 5,
          ),
        ],
      ),
    );
  }
}
