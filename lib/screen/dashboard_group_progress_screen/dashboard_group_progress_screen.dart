import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../model/quiz/quiz_model.dart';

part 'dashboard_group_progress_view.dart';

///グループごとの進捗状況
class GroupProgressDashboard extends ConsumerWidget {
  const GroupProgressDashboard();

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
      // height: context.height * 0.15,
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
            const _Title(
              title: "学習状況",
              subWidget: null,
              icon: Icons.speaker_group_sharp,
            ),
            // Gap(context.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _GroupProgressCart(groupName: group[0]),
                _GroupProgressCart(groupName: group[1]),
                _GroupProgressCart(groupName: group[2]),
                _GroupProgressCart(groupName: group[3]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///グループごとの進捗状況
class _GroupProgressCart extends ConsumerWidget {
  const _GroupProgressCart({required this.groupName});

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
    final correctCount =
        filterQuizList.where((x) => x.isJudge == true).toList().length;
    final scoreRatio = ((correctCount / quizLength) * 100).toStringAsFixed(0);
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
                      value: correctCount.toDouble(),
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
