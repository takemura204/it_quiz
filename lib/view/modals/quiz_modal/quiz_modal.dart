import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../../controller/home_quiz_modal/home_quiz_modal_controller.dart';
import '../../../controller/home_study/home_study_screen_controller.dart';
import '../../../model/lang/initial_resource.dart';
import '../../../model/quiz_item/quiz_item.dart';
import '../../../untils/enums.dart';
import '../../button/primary_button.dart';
import '../../button_icon/clear_button.dart';
import '../../icon/quarter_circle_icon.dart';
import '../../quiz_length_tab_bar.dart';
import '../dialog.dart';

part 'widget/footer.dart';
part 'widget/header.dart';
part 'widget/importance_menu.dart';
part 'widget/menu_title.dart';
part 'widget/status_menu.dart';

Future showQuizModal(BuildContext context, List<QuizItem> quizItemList) async {
  await showModalBottomSheet<Widget>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (context) {
      return QuizModal(quizItemList: quizItemList);
    },
  );
}

class QuizModal extends HookConsumerWidget {
  const QuizModal({required this.quizItemList});

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalValue = quizItemList.length;
    final correctValue = quizItemList.where((x) => x.status == StatusType.correct).toList().length;
    final incorrectValue =
        quizItemList.where((x) => x.status == StatusType.incorrect).toList().length;
    final learnedValue = quizItemList.where((x) => x.status == StatusType.learned).toList().length;
    final unlearnedValue = goalValue - (correctValue + incorrectValue + learnedValue);
    final selectedStudyLength =
        ref.watch(homeQuizScreenProvider.select((state) => state.selectedStudyLength));

    return Container(
      height: context.height * 0.65,
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///学習状況
                  const _StatusMenu(),
                  const Gap(10),

                  ///重要度
                  const _ImportanceMenu(),
                  const Gap(10),

                  const Gap(10),
                  const Divider(height: 1),
                  const Gap(10),

                  ///問題数
                  QuizLengthTabBar(
                    selectedLength: selectedStudyLength,
                    onTap: (length) {
                      ref.read(homeQuizScreenProvider.notifier).setStudyLength(length);
                    },
                  ),
                  const Gap(10),

                  Gap(context.height * 0.04),
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Header(title: '絞り込み'),
              _Footer(),
            ],
          ),
        ],
      ),
    );
  }
}
