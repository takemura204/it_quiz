import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

///Backボタン
class CustomBackButton extends ConsumerWidget {
  const CustomBackButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.center,
      child: IconButton(
        padding: EdgeInsets.all(context.width * 0.01),
        iconSize: context.width * 0.1,
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          LineIcons.angleLeft,
          color: context.mainColor,
          size: 25,
        ),
      ),
    );
  }
}
