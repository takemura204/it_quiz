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
      {required this.mission,
      required this.currentValue,
      required this.goalValue,
      required this.isRandomIconButton,
      required this.randomIconButtonTap});
  final Mission mission;
  final int currentValue;
  final int goalValue;
  final bool isRandomIconButton;
  final VoidCallback randomIconButtonTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = currentValue >= goalValue;
    return Container(
      height: context.height * 0.09,
      child: Card(
        elevation: 0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.0, vertical: context.width * 0.0),
        child: Row(
          children: [
            ///ミッションアイコン
            Container(
              width: context.height * 0.05,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.01),
              child: (isDone && mission.isReceived)
                  ? Column(
                      children: [
                        const Spacer(),
                        CompleteIcon(
                          size: context.height * 0.045,
                        ),
                        Gap(context.width * 0.01),
                        Text(
                          "+${mission.point}pt",
                          style: TextStyle(
                            fontSize: context.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      children: [
                        const Spacer(),
                        PointIcon(size: context.height * 0.045),
                        Gap(context.width * 0.01),
                        Text(
                          "+${mission.point}pt",
                          style: TextStyle(
                            fontSize: context.height * 0.015,
                            fontWeight: FontWeight.bold,
                            color: context.mainColor,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
            ),
            Gap(context.width * 0.01),

            ///ミッション状況
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(context.width * 0.01),
                  const Spacer(),
                  Row(
                    children: [
                      ///ミッション内容
                      Text(
                        mission.title,
                        style: TextStyle(
                          fontSize: context.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                      const Spacer(),

                      ///ランダムボタン
                      if (!isDone) ...[
                        if (isRandomIconButton)
                          RandomIconButton(
                            onPressed: randomIconButtonTap,
                            isCheck: true,
                          ),
                      ],

                      Gap(context.width * 0.03),
                    ],
                  ),
                  Gap(context.height * 0.01),
                  if (!isDone) ...[
                    ///プログレスバー
                    ProgressLineBar(
                      height: context.height * 0.025,
                      width: context.width * 0.75,
                      currentScore: currentValue,
                      goalScore: goalValue,
                      isUnit: true,
                    ),
                  ],
                  if (isDone && !mission.isReceived) ...[
                    Row(
                      children: [
                        const Spacer(),
                        PrimaryButton(
                            width: context.width * 0.3,
                            height: context.height * 0.035,
                            text: "受取",
                            onPressed: () => ref
                                .read(dashboardAchievementProvider.notifier)
                                .tapMissionReceiveButton(mission)),
                        Gap(context.width * 0.02),
                      ],
                    ),
                  ],
                  if (isDone && mission.isReceived) ...[
                    Row(
                      children: [
                        const Spacer(),
                        DisabledButton(
                          width: context.width * 0.3,
                          height: context.height * 0.035,
                          text: "受取済み",
                        ),
                        Gap(context.width * 0.02),
                      ],
                    ),

                    // CompleteIcon(size: context.height * 0.075),
                  ],
                  const Spacer(),
                ],
              ),
            ),
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
    final rankData = ref.watch(dashboardAchievementProvider).rankData!;
    final nextLevelUpScore =
        rankData.levelUpScore - (rankData.score % rankData.levelUpScore);
    final rankDataList =
        ref.watch(dashboardAchievementProvider.notifier).rankDataList;
    final totalScore = rankData.score + rankDataList[rankData.rankId].score;
    return GestureDetector(
      onTap: () {},
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
