import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';

///Clearボタン
class ClearButton extends ConsumerWidget {
  const ClearButton();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.bottomRight,
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        iconSize: 40,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    );
  }
}
