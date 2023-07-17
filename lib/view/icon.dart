import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

/// ポイントアイコン
class PointIcon extends ConsumerWidget {
  const PointIcon({required this.size});
  final double size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      child: Card(
        elevation: 2,
        color: context.backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(90),
        ),
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          child: Text(
            "P",
            style: TextStyle(
              color: context.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: context.height * 0.02,
            ),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}

class CompleteIcon extends ConsumerWidget {
  const CompleteIcon({required this.size});
  final double size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      child: Card(
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
            child: Text(
              "完了",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
                fontSize: context.height * 0.015,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    );
  }
}
