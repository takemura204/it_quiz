import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../button/defalut_button.dart';
import '../button/primary_button.dart';
import '../button/secondory_button.dart';

class PrimaryDialog extends ConsumerWidget {
  const PrimaryDialog({
    required this.onPressed,
    required this.title,
    required this.subWidget,
    required this.cancelText,
    required this.doneText,
  });

  final VoidCallback onPressed;
  final String title;
  final Widget subWidget;
  final String cancelText;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(15),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const Gap(15),
              subWidget,
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///キャンセル
                  SecondaryButton(
                      width: context.width * 0.4,
                      height: 50,
                      text: cancelText,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Gap(context.width * 0.05),

                  ///実行ボタン
                  PrimaryButton(
                    width: context.width * 0.4,
                    height: 50,
                    title: doneText,
                    onPressed: () {
                      onPressed();
                      HapticFeedback.lightImpact();
                    },
                  ),
                ],
              ),
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultDialog extends ConsumerWidget {
  const DefaultDialog({
    required this.onPressed,
    required this.title,
    required this.subWidget,
    required this.cancelText,
    required this.doneText,
  });

  final VoidCallback onPressed;
  final String title;
  final Widget subWidget;
  final String cancelText;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          height: context.height * 0.3,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: context.height * 0.05,
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: context.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: context.height * 0.13,
                child: Column(
                  children: [
                    const Spacer(),
                    subWidget,
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///キャンセル
                  SecondaryButton(
                      width: context.width * 0.4,
                      height: context.height * 0.06,
                      text: cancelText,
                      onPressed: onPressed),
                  Gap(context.width * 0.05),

                  ///実行する
                  DefaultButton(
                      width: context.width * 0.4,
                      height: context.height * 0.06,
                      title: doneText,
                      onPressed: onPressed),
                  const Spacer(),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryCloseDialog extends ConsumerWidget {
  const PrimaryCloseDialog(
      {required this.onPressed,
      required this.title,
      required this.subWidget,
      required this.doneText});

  final VoidCallback? onPressed;
  final String title;
  final Widget subWidget;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: context.width * 1,
          height: context.height * 0.3,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: context.height * 0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.width * 0.05,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: context.height * 0.13,
                child: Column(
                  children: [
                    const Spacer(),
                    subWidget,
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),

              ///ボタン
              PrimaryButton(
                  width: context.width * 0.8,
                  height: context.height * 0.06,
                  title: doneText,
                  onPressed: onPressed),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultCloseDialog extends ConsumerWidget {
  const DefaultCloseDialog(
      {required this.onPressed,
      required this.title,
      required this.iconWidget,
      required this.subWidget,
      required this.doneText});

  final VoidCallback? onPressed;
  final Widget? iconWidget;
  final String title;
  final Widget? subWidget;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          height: context.height * 0.35,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Gap(context.height * 0.005),
              const Spacer(),

              ///アイコン
              if (iconWidget != null) ...[
                Container(
                  height: context.height * 0.11,
                  child: iconWidget!,
                ),
              ],
              const Spacer(),

              ///タイトル
              Container(
                height: context.height * 0.05,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: context.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              ///本文
              if (subWidget != null) ...[
                Container(
                  height: context.height * 0.08,
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      const Spacer(),
                      subWidget!,
                      const Spacer(),
                    ],
                  ),
                ),
              ],
              const Spacer(),

              ///ボタン
              DefaultButton(
                  width: context.width * 0.8,
                  height: context.height * 0.06,
                  title: doneText,
                  onPressed: onPressed),
              const Spacer(),
              Gap(context.height * 0.005),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCloseDialog extends ConsumerWidget {
  const SecondaryCloseDialog(
      {required this.onPressed,
      required this.title,
      required this.subWidget,
      required this.doneText});

  final VoidCallback? onPressed;
  final String title;
  final Widget subWidget;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          height: context.height * 0.27,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Spacer(),

              ///タイトル
              Container(
                height: context.height * 0.05,
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: context.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),

              ///本文
              Container(
                height: context.height * 0.1,
                child: Column(
                  children: [
                    const Spacer(),
                    subWidget,
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              SecondaryButton(
                  width: context.width * 0.8,
                  height: context.height * 0.06,
                  text: doneText,
                  onPressed: onPressed),
              const Spacer(),
              Gap(context.width * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
