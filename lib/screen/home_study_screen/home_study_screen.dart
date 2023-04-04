import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/view/bar.dart';

import '../../resource/quiz/quiz_item_resource.dart';
import '../../view/dialog.dart';

class HomeStudyScreen extends ConsumerWidget {
  const HomeStudyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupedListView<QuizItem, String>(
        elements: quizItems,
        groupBy: (QuizItem item) => item.group,
        groupComparator: (value1, value2) =>
            value2.compareTo(value1), //グループのカスタムソートを定義
        itemComparator: (item1, item2) =>
            item2.title.compareTo(item1.title), //各グループ内の要素のカスタムソートを定義
        order: GroupedListOrder.DESC, //グループの並べ替え
        useStickyGroupSeparators: true, //現在表示されているグループのグループヘッダーが一番上に表示

        groupSeparatorBuilder: (String value) => Container(
              color: context.colors.main50.withOpacity(0.4),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
        itemBuilder: (BuildContext context, QuizItem item) {
          return StudyListBar(
            title: item.title,
            isCompleted: item.isCompleted,
            onTap: () => showDialog(
                context: context, builder: (_) => SelectQuizDialog(item)),
          );
        });
  }
}
