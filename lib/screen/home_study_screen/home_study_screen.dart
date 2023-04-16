import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

import '../../controller/quiz_item/quiz_item_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../screen_argument.dart';

part 'home_study_view.dart';

class HomeStudyScreen extends ConsumerWidget {
  const HomeStudyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        homeStudyScreenProvider.overrideWith(
          (ref) => HomeStudyScreenController(ref: ref),
        ),
      ],
      child: const _Scaffold(),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizItemProvider);
    return GroupedListView<QuizItemState, String>(
      elements: quizItemList,
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
        return _QuizItemBar(
          item: item,
          index: index,
        );
      },
    );
  }
}
