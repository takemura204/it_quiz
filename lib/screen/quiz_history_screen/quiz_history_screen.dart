import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/quiz_history/quiz_history_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/card/quiz_item_card.dart';

part 'quiz_history_view.dart';

class QuizHistoryScreen extends ConsumerWidget {
  const QuizHistoryScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizHistoryScreenProvider.overrideWith(
          (ref) => QuizHistoryScreenController(ref: ref),
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
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  String _formatDateGroup(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (timestamp.isAfter(today)) {
      return DateFormat('HH:mm').format(timestamp);
    } else if (timestamp.isAfter(today.subtract(const Duration(days: 365)))) {
      return DateFormat('MM/dd').format(timestamp);
    } else {
      return DateFormat('yyyy/MM/dd').format(timestamp);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizHistoryScreenProvider);
    final quizList = state.quizList;

    final displayedItemCount = min(quizList.length, 20);

    return ListView.builder(
      itemCount: displayedItemCount, // ここを修正
      itemBuilder: (context, index) {
        return Column(
          children: [
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                backgroundColor: Colors.white,
                collapsedBackgroundColor: Colors.white,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(5),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              quizList[index].category,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              I18n().studyTypeText(quizList[index].studyType),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(5),
                    Text(
                      quizList[index].title,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.width * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                    const Gap(5),
                    Text(
                      _formatDateGroup(quizList[index].timeStamp!),
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: context.width * 0.03,
                          fontWeight: FontWeight.normal),
                    ),
                    const Gap(5),
                  ],
                ),
                children: [
                  for (var quizItemIndex = 0;
                      quizItemIndex < quizList[index].quizItemList.length;
                      quizItemIndex++)

                    ///チェックボックスがすぐに反映されない。
                    QuizItemCard(
                      index: index,
                      quizItem: quizList[index].quizItemList[quizItemIndex],
                      studyType: quizList[index].studyType,
                      onTap: () => ref
                          .read(quizHistoryScreenProvider.notifier)
                          .tapCheckBox(index, quizItemIndex),
                    ),
                ],
              ),
            ),
            Divider(height: 0.5, color: Colors.grey.shade500),
          ],
        );
      },
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("履歴"),
      leading: CustomBackButton(onPressed: () async {
        Navigator.pop(context);
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
