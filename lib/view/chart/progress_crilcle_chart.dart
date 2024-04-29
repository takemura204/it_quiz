import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressCrilcleChart extends ConsumerWidget {
  const ProgressCrilcleChart({
    required this.width,
    required this.size,
    required this.goalScore,
    required this.currentScore,
    required this.thickness,
    required this.widget,
  });

  final double width;
  final double size;
  final int goalScore;
  final int currentScore;
  final double thickness;
  final Widget widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget,
          SfRadialGauge(axes: [
            RadialAxis(
              startAngle: 270,
              endAngle: 270,
              minimum: 0,
              maximum: goalScore.toDouble(),
              showLabels: false,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                thickness: thickness,
                color: Colors.grey.shade300,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: [
                RangePointer(
                  value: currentScore.toDouble(),
                  cornerStyle: currentScore >= goalScore
                      ? CornerStyle.bothFlat
                      : CornerStyle.bothCurve,
                  width: thickness,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: context.mainColor,
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
