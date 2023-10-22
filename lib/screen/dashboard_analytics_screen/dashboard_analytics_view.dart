part of 'dashboard_analytics_screen.dart';

///今日のメッセージ
class _DailyMessage extends ConsumerWidget {
  const _DailyMessage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.48,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: context.height * 0.12,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "千里の道も一歩から！\nコツコツ積み重ねていましょう!継続は今日からです！\na",
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.032,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
                const Spacer(),
              ],
            ),
          ),
          Container(
            width: context.height * 0.1,
            height: context.height * 0.1,
            child: Image.asset(
              'assets/image/cat_grey.png',
              fit: BoxFit.contain,
            ),
          ),
          Gap(context.height * 0.01),
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
    final group = ref
        .read(quizModelProvider)
        .quizList
        .map((quiz) => quiz.category)
        .toSet()
        .toList();
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
        .read(quizModelProvider)
        .quizList
        .where((x) => x.category == groupName)
        .expand((quiz) => quiz.quizItemList)
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
