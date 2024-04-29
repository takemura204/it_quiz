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
  final int goalScore;

  const QuizStatusProgressChart({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.correctValue,
    required this.incorrectValue,
    required this.learnedValue,
    required this.goalScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 全体のプログレスの割合を計算
    final totalProgress = (correctValue + incorrectValue) / goalScore;
    final progress1 = correctValue / goalScore;
    final progress2 = incorrectValue / goalScore;
    final progress3 = learnedValue / goalScore;
    final isAchieve = goalScore <= (correctValue + incorrectValue);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey.shade300,
      ),
      child: Stack(
        children: [
          // 正解
          Container(
            width: width * progress1,
            height: height,
            decoration: BoxDecoration(
              color: context.correctColor,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(borderRadius),
              ),
            ),
          ),
          // 不正解
          Positioned(
            left: width * progress1,
            child: Container(
              width: width * progress2,
              height: height,
              decoration: BoxDecoration(
                color: context.incorrectColor,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(isAchieve ? borderRadius : 0),
                ),
              ),
            ),
          ),

          ///学習済
          Container(
            width: width * progress3,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(isAchieve ? borderRadius : 0),
              ),
            ),
          ),
          Text('$progress3'),
        ],
      ),
    );
  }
}
