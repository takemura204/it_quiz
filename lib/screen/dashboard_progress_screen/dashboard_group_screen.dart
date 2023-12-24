import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/quiz/quiz_model.dart';

part 'dashboard_group_progress_view.dart';

///グループごとの進捗状況
class GroupProgressDashboard extends ConsumerWidget {
  const GroupProgressDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeQuizScreenProvider).isLoading;
    if (isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    final categoryList = ref.watch(homeQuizScreenProvider).categoryList;
    final correctRatios = ref.watch(homeQuizScreenProvider).correctRatios;

    return Container(
      child: Card(
        elevation: 2,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.01, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const _Title(
              title: "進捗状況",
              subWidget: null,
              icon: Icons.speaker_group_sharp,
            ),
            Gap(context.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: context.width * 0.04,
                      right: context.width * 0.02,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < categoryList.length; i++) ...[
                          if (i != 0) SizedBox(height: context.height * 0.01),
                          _GroupProgressCount(group: categoryList[i]),
                        ],
                        Gap(context.height * 0.01),
                        const Divider(color: Colors.grey),
                        const _TotalProgressCount(),
                        Gap(context.height * 0.01),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: context.backgroundColor.withOpacity(0.3),
                  height: context.width * 0.45,
                  width: context.width * 0.45,
                  padding: EdgeInsets.symmetric(
                      vertical: context.width * 0.02,
                      horizontal: context.width * 0.04),
                  margin: EdgeInsets.symmetric(
                      vertical: context.width * 0.02,
                      horizontal: context.width * 0.02),
                  child: _ProgressRadarChart(
                    categories: categoryList,
                    scoreRatios: correctRatios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupProgressCount extends ConsumerWidget {
  const _GroupProgressCount({required this.group});

  final String group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctNum = ref
        .read(quizModelProvider)
        .quizList
        .where((x) => x.category == group)
        .toList()
        .fold<int>(
          0,
          (previousValue, quiz) => previousValue + quiz.correctNum,
        );
    final quizLength = ref
        .read(quizModelProvider)
        .quizList
        .where((x) => x.category == group)
        .expand((quiz) => quiz.quizItemList)
        .toList()
        .length;
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$group:",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ' $correctNum / $quizLength',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalProgressCount extends ConsumerWidget {
  const _TotalProgressCount();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctNum = ref.read(quizModelProvider).quizList.toList().fold<int>(
          0,
          (previousValue, quiz) => previousValue + quiz.correctNum,
        );
    final filterQuizList = ref
        .read(quizModelProvider)
        .quizList
        .expand((quiz) => quiz.quizItemList)
        .toList();
    final quizLength = filterQuizList.length;
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "総合:",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ' $correctNum / $quizLength',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: context.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressRadarChart extends StatelessWidget {
  final List<String> categories;
  final List<double> scoreRatios;

  const _ProgressRadarChart({
    required this.categories,
    required this.scoreRatios,
  });

  @override
  Widget build(BuildContext context) {
    const List<double> maxValue = [100, 100, 100, 100]; //最大値
    const List<double> minValue = [0, 0, 0, 0]; //最小値
    return RadarChart(
      RadarChartData(
        dataSets: [
          RadarDataSet(
            dataEntries:
                maxValue.map((score) => RadarEntry(value: score)).toList(),
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            borderWidth: 1,
            entryRadius: 1,
          ),
          RadarDataSet(
            dataEntries:
                minValue.map((score) => RadarEntry(value: score)).toList(),
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            borderWidth: 1,
            entryRadius: 1,
          ),
          RadarDataSet(
            dataEntries:
                scoreRatios.map((score) => RadarEntry(value: score)).toList(),
            fillColor: context.mainColor.withOpacity(0.7),
            borderColor: context.mainColor,
            borderWidth: 2,
            entryRadius: 2,
          ),
        ],
        radarBackgroundColor: Colors.transparent,
        radarShape: RadarShape.polygon,
        radarBorderData: const BorderSide(color: Colors.grey, width: 1.5),
        getTitle: (index, angle) => RadarChartTitle(
          text: categories[index],
          angle: 0,
        ),
        titleTextStyle: TextStyle(
            color: context.mainColor,
            fontSize: context.height * 0.015,
            fontWeight: FontWeight.bold),
        titlePositionPercentageOffset: 0.07,
        tickCount: 4,
        ticksTextStyle: const TextStyle(color: Colors.grey, fontSize: 0),
        tickBorderData: BorderSide(color: Colors.grey.shade300, width: 1),
        gridBorderData: BorderSide(color: Colors.grey.shade300, width: 1.5),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }
}
