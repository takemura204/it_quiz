import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class ResultClearCard extends ConsumerWidget {
  const ResultClearCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.center,
      child: const FadeInAnimation(
        animateDirection: AnimateDirection.left,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CLEAR!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Gap(5),
                  Text(
                    ' 毎日の学習が成功を導いています！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 120,
            ),
          ],
        ),
      ),
    );
  }
}
