import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class ResultGoodCard extends ConsumerWidget {
  const ResultGoodCard();

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
      alignment: Alignment.center,
      child: const FadeInAnimation(
        animateDirection: AnimateDirection.left,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GOOD!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'いい感じですね！その調子です！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 100,
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
