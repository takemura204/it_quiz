import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_setting/home_setting_controller.dart';
import '../../model/user/auth_model.dart';
import '../button/defalut_button.dart';
import '../button/primary_button.dart';

class DailyGoalPicker extends ConsumerWidget {
  const DailyGoalPicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizCount = ref.watch(homeSettingProvider.notifier).quizCount;
    final dailyGoal = ref.watch(authModelProvider).dailyGoal;
    final initialItem = quizCount.indexOf(dailyGoal);
    final recommendItem = quizCount.indexOf(20);
    final dailyGoalController = FixedExtentScrollController(initialItem: initialItem);

    return Container(
      height: 380,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DefaultButton(
                    width: 100,
                    height: 40,
                    title: "おすすめ",
                    onPressed: () {
                      dailyGoalController.animateToItem(
                        recommendItem,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: context.width * 0.95,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      ListWheelScrollView(
                        controller: dailyGoalController,
                        physics: const FixedExtentScrollPhysics(),
                        useMagnifier: true,
                        magnification: 1.1,
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (index) {
                          ref
                              .read(homeSettingProvider.notifier)
                              .setSelectedQuizCountGoal(quizCount[index]);
                        },
                        itemExtent: 42,
                        children: quizCount.map((int count) {
                          return Center(
                            child: Text('$count問', style: const TextStyle(fontSize: 16)),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Gap(10),
          PrimaryButton(
              width: context.width * 0.85,
              height: 60,
              title: "設定する",
              onPressed: () {
                final selectedQuizCountGoal = ref.read(homeSettingProvider).selectedQuizCountGoal;

                ref.read(authModelProvider.notifier).updateDailyGoal(selectedQuizCountGoal);
                Navigator.pop(context);
              }),
          const Gap(20),
          const Spacer(),
        ],
      ),
    );
  }
}
