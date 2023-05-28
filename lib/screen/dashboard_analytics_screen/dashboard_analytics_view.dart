part of 'dashboard_analytics_screen.dart';

/// 今日のCircle Chart
class _DailyCart extends ConsumerWidget {
  const _DailyCart();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsScreenProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.22,
        ),
      );
    }
    final dailyData = state.dailyData!;
    final dailyScore = dailyData.quizData.length;
    final goalScore = state.goalScore;
    return Container(
      width: context.width * 0.45,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: context.height * 0.16,
            height: context.height * 0.16,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: context.height * 0.02,
                vertical: context.height * 0.02),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "今日の\n学習問題数",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: context.height * 0.015,
                    height: 1.2,
                  ),
                ),
                Text(
                  "$dailyScore",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.height * 0.045,
                    color: context.mainColor,
                  ),
                ),
                Text(
                  "/$goalScore",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.height * 0.015,
                    color: context.mainColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Container(
            width: context.height * 0.16,
            height: context.height * 0.16,
            child: CircularProgressIndicator(
              value: dailyScore / goalScore,
              strokeWidth: context.width * 0.03,
              color: context.mainColor,
              backgroundColor: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

///今日のメッセージ
class _DailyMessage extends ConsumerWidget {
  const _DailyMessage();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.45,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: context.height * 0.1,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "千里の道も一歩から！\nコツコツ積み重ねていましょう!\n継続は今日からです！",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: context.width * 0.03,
                  ),
                  maxLines: 3,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: context.height * 0.1,
            height: context.height * 0.1,
            child: Image.asset(
              'assets/image/cat_grey.png',
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///[週/月]の選択
class _SelectDayLength extends ConsumerWidget {
  const _SelectDayLength();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsScreenProvider);
    final controller = ref.watch(dashboardAnalyticsScreenProvider.notifier);
    final tabs = controller.tabs;
    final initialIndex = tabs.indexOf(state.selectedDayRange);
    final tabIndex = state.tabIndex;
    final dayRangeText = state.dayRangeText;
    final weekOffset = state.weekOffset;
    final monthOffset = state.monthOffset;
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.01),
      child: Row(
        children: [
          ///期間
          Container(
            width: context.width * 0.55,
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(context.width * 0.01),
                  iconSize: context.width * 0.06,
                  onPressed: () => ref
                      .read(dashboardAnalyticsScreenProvider.notifier)
                      .tapPreButton(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ((tabIndex == 0 && weekOffset == -3) ||
                            (tabIndex == 1 && monthOffset == -2))
                        ? Colors.grey.shade400
                        : context.mainColor,
                  ),
                ),
                const Spacer(),

                ///選択期間のスコア
                Text(
                  dayRangeText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.04),
                ),
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.all(context.width * 0.01),
                  iconSize: context.width * 0.06,
                  onPressed: () => ref
                      .read(dashboardAnalyticsScreenProvider.notifier)
                      .tapNextButton(),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: ((tabIndex == 0 && weekOffset == 0) ||
                            (tabIndex == 1 && monthOffset == 0))
                        ? Colors.grey.shade400
                        : context.mainColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: context.width * 0.35,
            alignment: Alignment.center,
            // color: Colors.blue,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: context.mainColor),
            ),
            child: DefaultTabController(
              length: tabs.length,
              initialIndex: initialIndex,
              child: TabBar(
                  onTap: (index) => ref
                      .read(dashboardAnalyticsScreenProvider.notifier)
                      .tapTabBar(index),
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  unselectedLabelColor: context.mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: context.mainColor),
                  tabs: [
                    Tab(
                      child: Text(
                        "週",
                        style: TextStyle(fontSize: context.width * 0.03),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("月",
                            style: TextStyle(fontSize: context.width * 0.03)),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

///毎日の目標設定
class _SetGoalY extends ConsumerWidget {
  const _SetGoalY();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalScore = ref.watch(dashboardAnalyticsScreenProvider).goalScore;
    return Container(
      height: context.height * 0.1,
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
            const Spacer(),
            Text(
              "毎日の目標",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: context.width * 0.04,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: goalScore <= 10
                  ? null
                  : () {
                      ref
                          .read(dashboardAnalyticsScreenProvider.notifier)
                          .setGoalY(goalScore - 10);
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                color:
                    goalScore <= 10 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            Text(
              "$goalScore",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.05),
            ),
            Text(
              "問",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: context.width * 0.04),
            ),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: goalScore >= 50
                  ? null
                  : () {
                      ref
                          .read(dashboardAnalyticsScreenProvider.notifier)
                          .setGoalY(goalScore + 10);
                    },
              icon: Icon(
                Icons.add_circle_outline,
                color:
                    goalScore >= 50 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///凡例
class _Legend extends ConsumerWidget {
  const _Legend();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.025,
      child: Row(
        children: [
          const Spacer(),
          Icon(
            Icons.circle,
            size: context.width * 0.035,
            color: context.mainColor,
          ),
          Text(
            "達成",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: context.width * 0.03,
            ),
          ),
          const Gap(10),
          Icon(
            Icons.circle,
            size: context.width * 0.035,
            color: Colors.grey.shade400,
          ),
          Text(
            "未達成",
            style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: context.width * 0.03),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///グループごとの進捗状況
class _GroupProgress extends ConsumerWidget {
  const _GroupProgress();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.15,
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
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: const [
                Spacer(),
                _ProgressChart(),
                Spacer(),
                _ProgressChart(),
                Spacer(),
                _ProgressChart(),
                Spacer(),
                _ProgressChart(),
                Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///グループごとの進捗状況
class _ProgressChart extends ConsumerWidget {
  const _ProgressChart();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardAnalyticsScreenProvider);
    if (state.isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.13,
        ),
      );
    }
    final dailyData = state.dailyData!;
    final dailyScore = dailyData.quizData.length;
    final goalScore = state.goalScore;
    return Container(
      width: context.width * 0.2,
      height: context.height * 0.13,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            child: Text(
              "猫のからだだ", //6文字まで
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.height * 0.013,
                color: context.mainColor,
              ),
              maxLines: 1,
            ),
          ),
          Gap(context.height * 0.008),
          Stack(
            children: [
              Container(
                width: context.width * 0.16,
                height: context.width * 0.16,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Spacer(),
                        Text(
                          "$dailyScore",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.025,
                            color: context.mainColor,
                          ),
                        ),
                        Text(
                          "％",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.01,
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                width: context.width * 0.16,
                height: context.width * 0.16,
                child: CircularProgressIndicator(
                  value: dailyScore / goalScore,
                  strokeWidth: context.width * 0.015,
                  color: context.mainColor,
                  backgroundColor: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
