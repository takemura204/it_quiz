import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

///設定タイトルBar
class SettingTitleBar extends ConsumerWidget {
  const SettingTitleBar({required this.title, required this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(left: 10, right: 20, bottom: 0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DefaultSettingBar extends ConsumerWidget {
  const DefaultSettingBar({required this.title, required this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        height: context.height * 0.05,
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: context.height * 0.015,
              ),
            ),
            const Spacer(),
            Icon(
              LineIcons.angleRight,
              color: context.mainColor,
              size: context.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSettingBar extends ConsumerWidget {
  const CustomSettingBar(
      {required this.title,
      required this.icon,
      required this.customWidget,
      required this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget customWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black54,
                size: 28,
              ),
              const Gap(10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              customWidget,
              const Gap(5),
              Icon(
                LineIcons.angleRight,
                color: context.mainColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressLineBar extends ConsumerWidget {
  const ProgressLineBar({
    required this.height,
    required this.width,
    required this.currentScore,
    required this.goalScore,
    required this.isUnit,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final bool isUnit;
  final int currentScore;
  final int goalScore;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDone = currentScore >= goalScore;
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: LinearProgressIndicator(
              value: (goalScore != 0) ? currentScore / goalScore : 0.0,
              color: context.mainColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
        if (isUnit)
          Positioned(
            right: width > context.width * 0.3 ? 8 : 3,
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$currentScore",
                    style: TextStyle(
                      color: isDone ? Colors.white : Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: width > context.width * 0.3 ? 14 : 10,
                    ),
                  ),
                  Text(
                    "/$goalScore",
                    style: TextStyle(
                        color: isDone ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.normal,
                        fontSize: width > context.width * 0.3 ? 14 : 10),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
