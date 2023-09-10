import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../view/mission/mission_widget.dart';
import '../../view/modals/quiz_modal.dart';
import '../../view/rank/rank_widget.dart';

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
    final state = ref.watch(quizModelProvider);
    final quizList = state.quizList;
    final testQuiz = state.testQuiz;
    final weakQuiz = state.weakQuiz;
    return Scaffold(
      appBar: const _AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GroupedListView<Quiz, String>(
            elements: quizList,
            groupBy: (Quiz quiz) => quiz.category,
            groupComparator: (value1, value2) => value2.compareTo(value1),
            //グループのカスタムソートを定義
            itemComparator: (item1, item2) => item2.id.compareTo(item1.id),
            //各グループ内の要素のカスタムソートを定義
            order: GroupedListOrder.DESC,
            //グループの並べ替え
            useStickyGroupSeparators: true,
            //現在表示されているグループのグループヘッダーが一番上に表示
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
            indexedItemBuilder: (BuildContext context, Quiz quiz, int index) {
              return Column(
                children: [
                  _QuizCard(
                    quiz: quiz,
                    index: index,
                  ),
                  Divider(height: 0.5, color: Colors.grey.shade500),
                  if (index == quizList.length - 1) Gap(context.height * 0.1),
                ],
              );
            },
          ),
          _BottomQuizMenu(
            weakQuiz: weakQuiz,
            testQuiz: testQuiz,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: const RankWidget(),
      leadingWidth: 125,
      title: Text(I18n().titleStudy),
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (_) => const DailyMissionWidget());
            },
            icon: Icon(
              Icons.pending_actions_outlined,
              size: 35,
              color: context.mainColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
