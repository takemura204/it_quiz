part of 'dashboard_achievement_screen.dart';

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subtitle, required this.icon});

  final String title;
  final String subtitle;
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
          Icon(
            icon,
            color: context.mainColor,
            size: context.height * 0.04,
          ),
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.024,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: context.height * 0.018,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

///　デイリーミッションCard

class _RankName extends ConsumerWidget {
  const _RankName({required this.rank});

  final Rank rank;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextLevelUpScore =
        rank.levelUpScore - (rank.score % rank.levelUpScore);
    final defaultRanks = ref.watch(rankModelProvider.notifier).defaultRanks;
    final totalScore = rank.score + defaultRanks[rank.rankId].score;
    return Container(
      width: context.width * 0.5,
      height: context.height * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),

          ///称号名
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rank.rankName,
                style: TextStyle(
                    fontSize: context.height * 0.03,
                    color: context.mainColor,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),

          ///経験値
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "${totalScore}pt",
              style: TextStyle(
                  fontSize: context.height * 0.04,
                  color: context.mainColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Gap(context.height * 0.01),

          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "次のレベルまであと${nextLevelUpScore}pt",
              style: TextStyle(
                fontSize: context.width * 0.035,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
          ),
          Gap(context.height * 0.01),
        ],
      ),
    );
  }
}
