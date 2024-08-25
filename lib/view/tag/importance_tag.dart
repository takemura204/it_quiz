import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

///重要度
class ImportanceTag extends ConsumerWidget {
  const ImportanceTag(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '重要度',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' ${I18n().quizImportanceText(quizItem.importance)}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
