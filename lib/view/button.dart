import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

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

///パスワード表示ボタン
class ObscureIconButton extends ConsumerWidget {
  const ObscureIconButton({required this.onPressed, required this.isObscure});
  final VoidCallback? onPressed;
  final bool isObscure;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed,
      // 表示アイコン
      icon: isObscure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility_outlined),
      color: isObscure ? Colors.grey : context.colors.main50,
    );
  }
}
