import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../../model/lang/initial_resource.dart';
import '../../../model/quiz/quiz_model.dart';
import '../../../model/quiz_item/quiz_item.dart';
import '../../../screen/screen_argument.dart';
import '../../../untils/enums.dart';
import '../../button/primary_button.dart';
import '../../button_icon/clear_button.dart';
import '../../icon/quarter_circle_icon.dart';

part 'widget/study_modal_footer.dart';
part 'widget/study_modal_header.dart';
part 'widget/study_modal_importance_menu.dart';
part 'widget/study_modal_range_menu.dart';
part 'widget/study_modal_status_menu.dart';

Future showStudyModal(BuildContext context, List<QuizItem> quizList) async {
  await showModalBottomSheet<Widget>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (context) {
      return StudyModal(quizItemList: quizList);
    },
  );
}

///クイズモーダル
class StudyModal extends HookConsumerWidget {
  const StudyModal({required this.quizItemList});

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalValue = quizItemList.length;
    final correctValue =
        quizItemList.where((x) => x.status == QuizStatusType.correct).toList().length;
    final incorrectValue =
        quizItemList.where((x) => x.status == QuizStatusType.incorrect).toList().length;
    final learnedValue =
        quizItemList.where((x) => x.status == QuizStatusType.learned).toList().length;
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(65),

                    ///分野
                    const _RangeMenu(),
                    const Gap(10),

                    ///学習状況
                    _StatusMenu(
                      goalValue: goalValue,
                      correctValue: correctValue,
                      incorrectValue: incorrectValue,
                      learnedValue: learnedValue,
                      unlearnedValue: unlearnedValue,
                    ),
                    const Gap(10),

                    ///重要度
                    const _ImportanceMenu(),
                    const Gap(10),

                    Gap(context.height * 0.04),
                    const Gap(100),
                  ],
                ),
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
