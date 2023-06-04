import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

/// ポイントアイコン
class PtIcon extends ConsumerWidget {
  const PtIcon();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.height * 0.04,
      height: context.height * 0.04,
      child: Card(
        elevation: 2,
        color: context.backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          width: context.height * 0.04,
          height: context.height * 0.04,
          alignment: Alignment.center,
          child: Text(
            "pt",
            style: TextStyle(
              color: context.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: context.height * 0.016,
            ),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
