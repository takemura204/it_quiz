import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
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
            right: width > context.width * 0.3 ? 8 : 4,
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$currentScore",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width > context.width * 0.3
                          ? context.width * 0.035
                          : context.width * 0.03,
                    ),
                  ),
                  Text(
                    "/$goalScore",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: width > context.width * 0.3
                            ? context.width * 0.035
                            : context.width * 0.03),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ProgressRangeChart extends ConsumerWidget {
  const ProgressRangeChart({
    required this.width,
    required this.size,
    required this.maxScore,
    required this.currentScore,
    required this.widget,
  });

  final double width;
  final double size;
  final int maxScore;
  final int currentScore;
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
            maximum: maxScore.toDouble(),
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 0.2,
              color: Colors.grey.shade300,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: [
              RangePointer(
                value: currentScore.toDouble(),
                cornerStyle: currentScore >= maxScore
                    ? CornerStyle.bothFlat
                    : CornerStyle.bothCurve,
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
