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
                LineProgressBar(
                    height: context.height * 0.015,
                    width: context.width * 0.6,
                    score: 1,
                    quizLength: 10),
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
    final rankData = ref.watch(dashboardRankProvider.notifier).rankData;
    final rankIndex = ref.watch(dashboardRankProvider).rankIndex;
    return GestureDetector(
      onTap: () {
        ref.read(dashboardRankProvider.notifier).tap(rankIndex);
      },
      child: Container(
        width: context.width * 0.3,
        height: context.width * 0.3,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ShaderMask(
              child: Icon(
                Icons.circle, // 変更されたアイコン
                size: context.width * 0.3,
                color: Colors.white,
              ),
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: [
                    rankData[rankIndex].colors.first,
                    rankData[rankIndex].colors.last,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                ).createShader(rect);
              },
            ),
            Icon(
              Icons.circle, // 変更されたアイコン
              size: context.width * 0.27,
              color: Colors.white,
            ),
            ShaderMask(
              child: Icon(
                Icons.school, // 変更されたアイコン
                size: context.width * 0.15,
                color: Colors.white,
              ),
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  colors: [
                    rankData[rankIndex].colors.first,
                    rankData[rankIndex].colors.last,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                ).createShader(rect);
              },
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
    final rankData = ref.watch(dashboardRankProvider.notifier).rankData;
    final rankIndex = ref.watch(dashboardRankProvider).rankIndex;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            Text(
              rankData[rankIndex].rankName,
              style: TextStyle(
                  fontSize: context.height * 0.022,
                  color: context.mainColor,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
