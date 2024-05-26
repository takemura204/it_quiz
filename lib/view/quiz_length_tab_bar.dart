import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../controller/tutorial/tutorial_controller.dart';

///問題数指定
class QuizLengthTabBar extends ConsumerWidget {
  const QuizLengthTabBar({required this.selectedLength, required this.onTap});

  final int selectedLength;
  final void Function(int) onTap; // 引数を取るように変更

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> selectLength = [5, 10, 20];
    final initialIndex = selectLength.indexOf(selectedLength);
    final homeTarget4 =
        ref.read(tutorialControllerProvider.notifier).homeTarget4;
    return Column(
      key: homeTarget4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '問題数を選択してください。',
          style: TextStyle(fontSize: 14),
        ),
        const Gap(10),
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: context.secondColor),
          ),
          child: DefaultTabController(
            length: 3,
            initialIndex: initialIndex,
            child: TabBar(
                onTap: (index) {
                  onTap(selectLength[index]); // 選択された問題数を渡す
                  HapticFeedback.lightImpact();
                },
                labelColor: context.mainColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5, color: context.mainColor),
                    color: context.backgroundColor.withOpacity(0.5)),
                tabs: [
                  Tab(
                    child: Text(
                      "${selectLength[0]}問",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[1]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[2]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
