import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../view/icon_button.dart';
import '../screen_argument.dart';

part 'home_quiz_view.dart';

class HomeQuizScreen extends ConsumerWidget {
  const HomeQuizScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        homeQuizScreenProvider.overrideWith(
          (ref) => HomeQuizScreenController(ref: ref),
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
    final quizList = ref.watch(quizModelProvider).quizList;
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleStudy),
      ),
      body: GroupedListView<Quiz, String>(
        elements: quizList,
        groupBy: (Quiz item) => item.category,
        groupComparator: (value1, value2) =>
            value2.compareTo(value1), //グループのカスタムソートを定義
        itemComparator: (item1, item2) =>
            item2.title.compareTo(item1.title), //各グループ内の要素のカスタムソートを定義
        order: GroupedListOrder.DESC, //グループの並べ替え
        useStickyGroupSeparators: true, //現在表示されているグループのグループヘッダーが一番上に表示
        groupSeparatorBuilder: (String group) => Container(
          color: context.mainColor,
          padding: EdgeInsets.all(context.width * 0.015),
          child: Text(
            group,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontSize: context.width * 0.05,
                fontWeight: FontWeight.bold),
          ),
        ),
        indexedItemBuilder: (BuildContext context, Quiz item, int index) {
          return _QuizItemBar(
            item: item,
            index: index,
          );
        },
      ),
    );
  }
}
