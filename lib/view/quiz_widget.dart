import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../model/quiz/quiz.dart';

class QuizStyleTitle extends ConsumerWidget {
  const QuizStyleTitle(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      child: Container(
        height: context.height * 0.05,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                item.title,
                style: TextStyle(
                    fontSize: context.width * 0.04,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
