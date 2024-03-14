import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

///ランダムボタン
class RandomIconButton extends ConsumerWidget {
  const RandomIconButton({required this.onPressed, required this.isCheck});

  final VoidCallback? onPressed;
  final bool isCheck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.06,
      height: context.width * 0.06,
      decoration: BoxDecoration(
        // color: Colors.amber,
        border: Border.all(
          color: context.mainColor,
          width: 1.5,
        ),
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onPressed,
        alignment: Alignment.center,
        iconSize: context.width * 0.05,
        // 表示アイコン
        icon: const Icon(Icons.repeat_outlined),
        color: isCheck ? context.mainColor : Colors.grey,
      ),
    );
  }
}
