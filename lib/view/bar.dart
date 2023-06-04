import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

///ログインエラーBar
class LoginErrorBar extends ConsumerWidget {
  const LoginErrorBar({required this.errorText});
  final String errorText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(10),
        color: context.backgroundColor.withOpacity(0.5),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ),
          Container(
            width: context.width * 0.84,
            child: Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}

///設定タイトルBar
class SettingTitleBar extends ConsumerWidget {
  const SettingTitleBar({required this.title, required this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1.0,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          child: Container(
            height: context.height * 0.05,
            color: Colors.grey.withOpacity(0.3),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingListBar extends ConsumerWidget {
  const SettingListBar({required this.title, required this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1.0,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          height: context.height * 0.05,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.height * 0.015,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: context.height * 0.025,
                  color: context.mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressLineBar extends ConsumerWidget {
  const ProgressLineBar({
    required this.height,
    required this.width,
    required this.score,
    required this.quizLength,
    required this.isUnit,
  });
  final double height;
  final double width;
  final bool isUnit;
  final int score;
  final int quizLength;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Container(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: (quizLength != 0) ? score / quizLength : 0.0,
              color: context.mainColor,
              backgroundColor: Colors.grey.shade400,
            ),
          ),
        ),
        Gap(context.width * 0.01),
        if (isUnit)
          Row(
            children: [
              Text(
                "$score",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.width * 0.035,
                ),
              ),
              Text(
                "/$quizLength",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.03),
              ),
            ],
          ),
      ],
    );
  }
}

class ProgressRangeChart extends ConsumerWidget {
  const ProgressRangeChart({
    required this.width,
    required this.size,
    required this.length,
    required this.score,
    required this.widget,
  });
  final double width;
  final double size;
  final int length;
  final int score;
  final Widget widget;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: SfRadialGauge(axes: [
        RadialAxis(
            startAngle: 270,
            endAngle: 270,
            minimum: 0,
            maximum: length.toDouble(),
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
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
            annotations: [
              GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Container(
                  width: width,
                  height: size,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.height * 0.02,
                      vertical: context.height * 0.02),
                  child: widget,
                ),
              ),
            ]),
      ]),
    );
  }
}
