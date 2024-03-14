import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

///パスワード表示ボタン
class PasswordIconButton extends ConsumerWidget {
  const PasswordIconButton({required this.onPressed, required this.isObscure});

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
      color: isObscure ? Colors.grey : context.mainColor,
    );
  }
}
