import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../resource/quiz/quiz_item_resource.dart';
import '../../view/dialog.dart';

class HomeStudyScreen extends ConsumerWidget {
  const HomeStudyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupedListView<QuizItemState, String>(
      elements: quizItems,
      groupBy: (QuizItemState item) => item.group,
      groupComparator: (value1, value2) =>
          value2.compareTo(value1), //グループのカスタムソートを定義
      itemComparator: (item1, item2) =>
          item2.title.compareTo(item1.title), //各グループ内の要素のカスタムソートを定義
      order: GroupedListOrder.DESC, //グループの並べ替え
      useStickyGroupSeparators: true, //現在表示されているグループのグループヘッダーが一番上に表示

      groupSeparatorBuilder: (String group) => Container(
        color: context.colors.main50.withOpacity(0.4),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          group,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      indexedItemBuilder:
          (BuildContext context, QuizItemState item, int index) {
        return ProviderScope(
          overrides: [
            quizChoiceScreenControllerProvider.overrideWith(
              (ref) => QuizChoiceScreenController(ref: ref, item: item),
            ),
          ],
          child: QuizItemBar(
            item: item,
            index: index,
          ),
        );
      },
    );
  }
}

///問題一覧Bar
class QuizItemBar extends ConsumerWidget {
  const QuizItemBar({required this.item, required this.index});
  final QuizItemState item;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = quizItems.reversed.toList();
    final quizItem =
        ref.watch(quizChoiceScreenControllerProvider).quizItem ?? item;
    return GestureDetector(
      onTap: () {
        print(quizList[index].isCompleted);
        quizList[index] = QuizItemState(
          id: quizItem.id,
          group: quizItem.group,
          title: quizItem.title,
          isCompleted: true,
          quizList: quizItem.quizList,
        );
        print(quizList[index].isCompleted);
        showDialog(
            context: context, builder: (_) => SelectQuizDialog(quizItem));
        // ref.read(quizChoiceScreenControllerProvider.notifier).setQuizScore();
      },
      child: Card(
        elevation: 1.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 3.0),
        child: Container(
          child: ListTile(
            contentPadding: const EdgeInsets.only(
                left: 10.0, top: 1.0, bottom: 1.0, right: 5),
            title: Text(
              item.title,
              style: const TextStyle(fontSize: 16),
            ),
            leading: quizList[index].isCompleted
                ? Icon(
                    Icons.pets,
                    color: context.colors.main50.withOpacity(0.6),
                  )
                : const Icon(
                    Icons.pets,
                  ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
