part of 'dashboard_rank_screen.dart';

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
        left: context.width * 0.03,
        top: context.width * 0.01,
        right: context.width * 0.03,
        bottom: 0.005,
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
                fontSize: context.height * 0.022,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: context.height * 0.015,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

///　デイリーミッションCard
class _DailyMissionCard extends ConsumerWidget {
  const _DailyMissionCard(
      {required this.title, required this.isDone, required this.point});
  final String title;
  final bool isDone;
  final int point;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.09,
      child: Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ///ミッションアイコン
            Container(
              width: context.width * 0.1,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.01),
              child: Column(
                children: [
                  const Spacer(),
                  const PtIcon(),
                  Gap(context.width * 0.005),
                  Text(
                    "+${point}pt",
                    style: TextStyle(
                      fontSize: context.height * 0.014,
                      fontWeight: FontWeight.bold,
                      color: context.mainColor,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Gap(context.width * 0.01),

            ///ミッション内容
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  height: context.height * 0.04,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: context.width * 0.04,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Gap(context.width * 0.005),
                ProgressLineBar(
                  height: context.height * 0.015,
                  width: context.width * 0.6,
                  score: 1,
                  quizLength: 10,
                  isUnit: true,
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _RankBatch extends ConsumerWidget {
  const _RankBatch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final rankData = ref.watch(dashboardRankProvider.notifier).rankData;
    // final rankIndex = ref.watch(dashboardRankProvider).rankIndex;
    return GestureDetector(
      onTap: () {
        // ref.read(dashboardRankProvider.notifier).tap(rankIndex);
      },
      child: Card(
        elevation: 3,
        color: context.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.circle_outlined, // 変更されたアイコン
              size: context.width * 0.25,
              color: context.mainColor,
            ),
            Icon(
              Icons.pets, // 変更されたアイコン
              size: context.width * 0.1,
              color: context.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _RankName extends ConsumerWidget {
  const _RankName();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankData = ref.watch(dashboardRankProvider).rankData!;
    final rankDataList =
        ref.watch(dashboardRankProvider.notifier).initRankDataList;

    return GestureDetector(
      onTap: () {
        // ref.read(dashboardRankProvider.notifier).updatePoint(5);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),

          ///称号名
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rankData.rankName,
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
              "${rankData.levelScore}pt",
              style: TextStyle(
                  fontSize: context.height * 0.035,
                  color: context.mainColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            child: Text(
              "次のレベルまであと${rankData.levelScore}pt",
              style: TextStyle(
                fontSize: context.width * 0.03,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
