import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
