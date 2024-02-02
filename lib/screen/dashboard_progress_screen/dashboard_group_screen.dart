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
        elevation: 1,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.01, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const _Title(
              title: "進捗状況",
              subWidget: null,
              icon: Icons.speaker_group_sharp,
            ),
            const Gap(10),
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
                          if (i != 0) const Gap(10),
                          _GroupProgressCount(group: categoryList[i]),
                        ],
                        const Gap(10),
                        const Divider(color: Colors.grey, height: 1),
                        const Gap(10),
                        const _TotalProgressCount(),
                        const Gap(10),
                      ],
                    ),
                  ),
                ),
                const Gap(10),
                Container(
                  color: context.backgroundColor.withOpacity(0.3),
                  height: context.width * 0.5,
                  width: context.width * 0.5,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "$group:",
                style: context.texts.titleSmall,
              ),
            ],
          ),
          const Gap(5),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.mainColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                height: 8,
                width: ('$correctNum'.length.toDouble()) * 20 +
                    ('$quizLength'.length.toDouble()) * 10 +
                    10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$correctNum",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(1),
                  const Text(
                    '/',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "$quizLength",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "総合:",
                    style: context.texts.titleSmall,
                  ),
                ],
              ),
              const Gap(5),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.mainColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    height: 8,
                    width: ('$correctNum'.length.toDouble()) * 20 +
                        ('$quizLength'.length.toDouble()) * 10 +
                        10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$correctNum",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(1),
                      const Text(
                        '/',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "$quizLength",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
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
    // categoriesの長さに基づいて最大値と最小値のリストを動的に生成
    final List<double> maxValue = List.filled(categories.length, 100); // 最大値
    final List<double> minValue = List.filled(categories.length, 0); // 最小値

    return RadarChart(
      RadarChartData(
        dataSets: [
          // 最大値のデータセット
          RadarDataSet(
            dataEntries:
                maxValue.map((score) => RadarEntry(value: score)).toList(),
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            borderWidth: 1,
            entryRadius: 1,
          ),
          // 最小値のデータセット
          RadarDataSet(
            dataEntries:
                minValue.map((score) => RadarEntry(value: score)).toList(),
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            borderWidth: 1,
            entryRadius: 1,
          ),
          // スコアのデータセット
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
            color: context.mainColor, fontSize: 9, fontWeight: FontWeight.bold),
        titlePositionPercentageOffset: 0.2,
        tickCount: categories.length,
        ticksTextStyle: const TextStyle(color: Colors.grey, fontSize: 0),
        tickBorderData: BorderSide(color: Colors.grey.shade300, width: 1),
        gridBorderData: BorderSide(color: Colors.grey.shade300, width: 1.5),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }
}
