part of '../home_dashboard_screen.dart';

///今日のX軸操作
class _SetTodayData extends ConsumerWidget {
  const _SetTodayData();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayScore = ref.watch(homeDashboardScreenProvider).dayScore;
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
              "今日のデータ",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: context.width * 0.04,
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: dayScore <= 10
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setTodayData(dayScore - 1);
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                color:
                    dayScore <= 10 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            Text(
              "$dayScore",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: context.width * 0.05),
            ),
            Text(
              "操作",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: context.width * 0.04),
            ),
            IconButton(
              padding: EdgeInsets.all(context.width * 0.01),
              iconSize: context.width * 0.08,
              onPressed: dayScore >= 50
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setTodayData(dayScore + 1);
                    },
              icon: Icon(
                Icons.add_circle_outline,
                color:
                    dayScore >= 50 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///x軸の範囲操作
class _SelectDayLength extends ConsumerWidget {
  const _SelectDayLength();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDashboardScreenProvider);
    final controller = ref.watch(homeDashboardScreenProvider.notifier);
    final tabs = controller.tabs;
    final initialIndex = tabs.indexOf(state.selectedDayRange);
    final dayRangeText = state.dayRangeText;

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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.04, vertical: context.width * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'X軸の範囲を選択してください。',
                style: TextStyle(fontSize: context.width * 0.03),
              ),

              ///[週/月/年]の選択タブ
              Container(
                height: context.height * 0.05,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: context.mainColor),
                ),
                child: DefaultTabController(
                  length: tabs.length,
                  initialIndex: initialIndex,
                  child: TabBar(
                      onTap: (index) => ref
                          .read(homeDashboardScreenProvider.notifier)
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
                            style: TextStyle(fontSize: context.width * 0.04),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("月",
                                style:
                                    TextStyle(fontSize: context.width * 0.04)),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("年",
                                style:
                                    TextStyle(fontSize: context.width * 0.04)),
                          ),
                        ),
                      ]),
                ),
              ),
              const Spacer(),

              ///トータルスコア
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(context.width * 0.01),
                    iconSize: context.width * 0.08,
                    onPressed: () => ref
                        .read(homeDashboardScreenProvider.notifier)
                        .tapPreButton(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: context.mainColor,
                    ),
                  ),
                  const Spacer(),

                  ///選択期間のスコア
                  Text(
                    dayRangeText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.05),
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.all(context.width * 0.01),
                    iconSize: context.width * 0.08,
                    onPressed: () => ref
                        .read(homeDashboardScreenProvider.notifier)
                        .tapNextButton(),
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: context.mainColor,
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///毎日の目標設定
class _SetGoalY extends ConsumerWidget {
  const _SetGoalY();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalY = ref.watch(homeDashboardScreenProvider).goalY;
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
              onPressed: goalY <= 10
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setGoalY(goalY - 10);
                      print("a");
                    },
              icon: Icon(
                Icons.remove_circle_outline,
                color: goalY <= 10 ? Colors.grey.shade400 : context.mainColor,
              ),
            ),
            Text(
              "$goalY",
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
              onPressed: goalY >= 50
                  ? null
                  : () {
                      ref
                          .read(homeDashboardScreenProvider.notifier)
                          .setGoalY(goalY + 10);
                    },
              icon: Icon(
                Icons.add_circle_outline,
                color: goalY >= 50 ? Colors.grey.shade400 : context.mainColor,
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
