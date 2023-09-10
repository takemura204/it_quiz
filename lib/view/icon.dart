import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

/// Expアイコン
class ExpIcon extends ConsumerWidget {
  const ExpIcon({required this.exp, required this.isCompleted});

  final int exp;
  final bool isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.height * 0.062,
      height: context.height * 0.062,
      margin: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.width * 0.01),
      child: Card(
        elevation: 1,
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.045,
                  width: context.height * 0.045,
                  child: Card(
                    elevation: 1,
                    color: context.backgroundColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: context.mainColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Container(
                      height: context.height * 0.04,
                      width: context.height * 0.04,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "EXP",
                          style: TextStyle(
                            color: context.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.013,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.height * 0.05,
                  height: context.height * 0.05,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$exp",
                    style: TextStyle(
                      fontSize: context.height * 0.018,
                      fontWeight: FontWeight.bold,
                      color: context.mainColor,
                      shadows: [
                        Shadow(
                          offset: const Offset(-1.0, -1.0),
                          color: Colors.grey.shade100,
                        ),
                        Shadow(
                          offset: const Offset(1.0, -1.0),
                          color: Colors.grey.shade100,
                        ),
                        Shadow(
                          offset: const Offset(1.0, 1.0),
                          color: Colors.grey.shade100,
                        ),
                        Shadow(
                          offset: const Offset(-1.0, 1.0),
                          color: Colors.grey.shade100,
                        ),
                      ],
                    ),
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

class CompleteIcon extends ConsumerWidget {
  const CompleteIcon({required this.exp, required this.size});

  final int exp;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade400,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(90),
      ),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: -15 * math.pi / 180,
          child: Column(
            children: [
              Text(
                "完了",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: context.height * 0.015,
                ),
                overflow: TextOverflow.fade,
              ),
              Gap(context.width * 0.01),
              Text(
                "+${exp}pt",
                style: TextStyle(
                  fontSize: context.height * 0.015,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
