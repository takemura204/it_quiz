import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/entity/quiz_item/quiz_item.dart';

import '../../view/dialog.dart';

List<QuizItem> quizItems = [
  const QuizItem(id: 1, group: "TeamA", title: "問題A-1"),
  const QuizItem(id: 2, group: "TeamA", title: "問題A-2"),
  const QuizItem(id: 3, group: "TeamB", title: "問題B-1"),
  const QuizItem(id: 4, group: "TeamB", title: "問題B-2"),
  const QuizItem(id: 5, group: "TeamC", title: "問題C-1"),
  const QuizItem(id: 6, group: "TeamC", title: "問題C-2"),
  const QuizItem(id: 7, group: "TeamA", title: "問題A-3"),
  const QuizItem(id: 8, group: "TeamB", title: "問題B-3"),
  const QuizItem(id: 9, group: "TeamC", title: "問題C-3"),
  const QuizItem(id: 10, group: "TeamD", title: "問題D-1"),
];

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

        groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
        itemBuilder: (BuildContext context, QuizItem item) {
          return GestureDetector(
            onTap: () async {
              final selectedText = await showDialog(
                  context: context, builder: (_) => SelectAnsDialog(item));
              print(selectedText);
            },
            child: Card(
              elevation: 1.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              child: Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  leading: const Icon(Icons.account_circle),
                  title: Text(item.title),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
          );
        });
  }
}
