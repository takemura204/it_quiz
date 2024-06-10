import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/quiz/quiz_model.dart';
import '../../view/button/primary_button.dart';
import '../../view/chart/progress_line_chart.dart';
import '../screen_argument.dart';

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
    final isPremium = ref.watch(authModelProvider).isPremium;

    return Container(
      child: Card(
        elevation: 0,
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
            if (isPremium)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///レーダーチャート
                  Container(
                    height: context.width * 0.6,
                    width: context.width,
                    padding: EdgeInsets.symmetric(
                        vertical: context.width * 0.02,
                        horizontal: context.width * 0.04),
                    margin:
                        EdgeInsets.symmetric(horizontal: context.width * 0.02),
                    child: _ProgressRadarChart(
                      categories: categoryList,
                      scoreRatios: correctRatios,
                    ),
                  ),

                  Container(
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
                  const Gap(10),
                ],
              )
            else
              GestureDetector(
                onTap: () {
                  context.showScreen(
                      const PremiumDetailScreenArguments().generateRoute());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/image/dashboard_progress_sample.png',
                      color: Colors.white.withOpacity(0.1),
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Container(
                      width: context.width * 0.8,
                      child: Column(
                        children: [
                          const Gap(45),
                          Icon(
                            LineIcons.lock,
                            size: 35,
                            color: context.accentColor,
                          ),
                          const Gap(10),
                          Text(
                            'プレミアムを購入すると\nご利用いただけます',
                            style: TextStyle(
                              color: context.accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(30),
                          PrimaryRoundButton(
                              width: 180,
                              height: 50,
                              text: '購入する',
                              fontSize: 16,
                              onPressed: () {
                                context.showScreen(
                                    const PremiumDetailScreenArguments()
                                        .generateRoute());
                              })
                        ],
                      ),
                    ),
                  ],
                ),
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
              Container(
                width: 130,
                child: Text(
                  "$group：",
                  style: context.texts.titleSmall,
                ),
              ),
              Expanded(
                child: ProgressLineChart(
                  height: 20,
                  width: context.width,
                  currentScore: correctNum,
                  goalScore: quizLength,
                  isUnit: true,
                  borderRadius: 3,
                ),
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
                  Container(
                    width: 130,
                    child: Text(
                      "総合：",
                      style: context.texts.titleSmall,
                    ),
                  ),
                  Expanded(
                    child: ProgressLineChart(
                      height: 20,
                      width: context.width,
                      currentScore: correctNum,
                      goalScore: quizLength,
                      isUnit: true,
                      borderRadius: 3,
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
    // categoriesの長さに基づいて最大値と最小値のリストを動的に生成
    final List<double> maxValue = List.filled(categories.length, 100); // 最大値
    final List<double> minValue = List.filled(categories.length, 0); // 最小値

    // final testData = [40.0, 25.0, 55.0, 65.0];

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
            // testData.map((score) => RadarEntry(value: score)).toList(),
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
          positionPercentageOffset: index == 0 ? 0.1 : 0.35,
        ),
        titleTextStyle: TextStyle(
            color: context.mainColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
        tickCount: categories.length,
        ticksTextStyle: const TextStyle(color: Colors.grey, fontSize: 0),
        tickBorderData: BorderSide(color: Colors.grey.shade300, width: 1),
        gridBorderData: BorderSide(color: Colors.grey.shade300, width: 1.5),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }
}
