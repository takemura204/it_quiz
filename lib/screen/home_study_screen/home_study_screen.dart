import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_state.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_state.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/view/bar.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
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
      indexedItemBuilder: (BuildContext context, QuizItem item, int index) {
        return ProviderScope(
          overrides: [
            homeStudyScreenControllerProvider.overrideWithProvider(
                StateNotifierProvider<HomeStudyScreenController,
                    HomeStudyScreenState>(
              (ref) => HomeStudyScreenController(ref: ref, item: item),
            )),
            quizChoiceScreenControllerProvider.overrideWithProvider(
                StateNotifierProvider<QuizChoiceScreenController,
                    QuizChoiceScreenState>(
              (ref) => QuizChoiceScreenController(ref: ref, item: item),
            )),
          ],
          child: QuizItemBar(
            title: item.title,
            isCompleted:
                item.quizList.where((x) => x.isJudge == true).toList().length ==
                    item.quizList.length,
            onTap: () {
              print(item.title);
              showDialog(
                  context: context, builder: (_) => SelectQuizDialog(item));
            },
          ),
        );
      },
    );
  }
}
