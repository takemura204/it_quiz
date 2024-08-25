import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';

///カテゴリ
class CategoryTag extends ConsumerWidget {
  const CategoryTag({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.select((s) => s.quizList));
    final categoryName = quizList
        .firstWhere((quiz) => quiz.quizItemList.any((item) => item.quizId == quizItem.quizId))
        .category;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
