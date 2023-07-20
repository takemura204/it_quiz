part of 'dashboard_analytics_screen.dart';

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
    final state = ref.watch(dashboardAnalyticsProvider);
    final controller = ref.watch(dashboardAnalyticsProvider.notifier);
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
                      .read(dashboardAnalyticsProvider.notifier)
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
                      .read(dashboardAnalyticsProvider.notifier)
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
                      .read(dashboardAnalyticsProvider.notifier)
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
class GroupProgress extends ConsumerWidget {
  const GroupProgress();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group =
        ref.read(quizItemProvider).map((item) => item.group).toSet().toList();
    if (group.isEmpty) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.15,
        ),
      );
    }
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
              children: [
                const Spacer(),
                _ProgressMeterCart(groupName: group[0]),
                const Spacer(),
                _ProgressMeterCart(groupName: group[1]),
                const Spacer(),
                _ProgressMeterCart(groupName: group[2]),
                const Spacer(),
                _ProgressMeterCart(groupName: group[3]),
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

///グループごとの進捗状況
class _ProgressMeterCart extends ConsumerWidget {
  const _ProgressMeterCart({required this.groupName});
  final String groupName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterQuizList = ref
        .read(quizItemProvider)
        .where((x) => x.group == groupName)
        .expand((quizItem) => quizItem.quizList)
        .toList();
    final quizLength = filterQuizList.length;
    final score =
        filterQuizList.where((x) => x.isJudge == true).toList().length;
    final scoreRatio = ((score / quizLength) * 100).toStringAsFixed(0);
    return Container(
      width: context.width * 0.2,
      height: context.height * 0.13,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: context.width * 0.2,
            height: context.width * 0.2,
            child: SfRadialGauge(axes: [
              RadialAxis(
                  minimum: 0,
                  maximum: quizLength.toDouble(),
                  showLabels: false,
                  showTicks: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.grey.shade300,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: [
                    RangePointer(
                      value: score.toDouble(),
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: context.mainColor,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Spacer(),
                          Text(
                            "$scoreRatio",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.height * 0.03,
                              color: context.mainColor,
                            ),
                          ),
                          Text(
                            "%",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: context.height * 0.015,
                              color: Colors.black54,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    GaugeAnnotation(
                      positionFactor: 1.1,
                      angle: 90,
                      widget: Text(
                        groupName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.height * 0.015,
                          color: context.mainColor,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ]),
            ]),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
