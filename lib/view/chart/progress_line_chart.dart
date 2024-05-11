import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class ProgressLineChart extends ConsumerWidget {
  const ProgressLineChart({
    required this.height,
    required this.width,
    required this.currentScore,
    required this.goalScore,
    required this.isUnit,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final bool isUnit;
  final int currentScore;
  final int goalScore;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = currentScore >= goalScore;
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: LinearProgressIndicator(
              value: (goalScore != 0) ? currentScore / goalScore : 0.0,
              color: context.mainColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
        if (isUnit)
          Positioned(
            right: width > context.width * 0.3 ? 8 : 3,
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$currentScore",
                    style: TextStyle(
                      color: isDone ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: width > context.width * 0.3 ? 14 : 10,
                    ),
                  ),
                  Text(
                    "/$goalScore",
                    style: TextStyle(
                        color: isDone ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: width > context.width * 0.3 ? 14 : 10),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class QuizStatusProgressChart extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final int correctValue;
  final int incorrectValue;
  final int learnedValue;
  final int unlearnedValue;
  final int goalScore;

  const QuizStatusProgressChart({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.correctValue,
    required this.incorrectValue,
    required this.learnedValue,
    required this.unlearnedValue,
    required this.goalScore,
  });

  @override
  Widget build(BuildContext context) {
    // 全体のプログレスの割合を計算
    final correctRate = correctValue / goalScore;
    final incorrectRate = incorrectValue / goalScore;
    final learnRate = learnedValue / goalScore;
    final unlearnRate = unlearnedValue / goalScore;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        child: Row(
          children: [
            buildBarSegment(context, context.secondColor, unlearnRate, '未学習'),
            buildBarSegment(context, context.backgroundColor, learnRate, '学習済'),
            buildBarSegment(
                context, context.incorrectColor, incorrectRate, '不正解'),
            buildBarSegment(context, context.correctColor, correctRate, '正解'),
          ],
        ),
      ),
    );
  }

  Widget buildBarSegment(
      BuildContext context, Color color, double progress, String label) {
    return Expanded(
      flex: (progress * 1000).round(), // セグメントの幅を割合で調整
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Text(
          width > 50
              ? progress > 0
                  ? '${(progress * 100).round()}%'
                  : ''
              : '',
          style:
              context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
