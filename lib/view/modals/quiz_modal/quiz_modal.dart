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
import '../../quiz_length_tab_bar.dart';

part 'quiz_modal_status_cards.dart';
part 'widget/quiz_modal_title.dart';

///出題範囲、学習状況、重要度、問題範囲、単語→答え、繰り返し、保存済み、苦手、全て選択
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

///モーダル
class QuizModal extends HookConsumerWidget {
  const QuizModal({required this.quizItemList});

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  const Gap(65),
                  StudyModalList(quizItemList: quizItemList),
                  const Gap(100),
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ModalTitle(title: '絞り込み'),
              _SelectFilterButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class StudyModalList extends ConsumerWidget {
  const StudyModalList({required this.quizItemList});

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
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///分野
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '出題範囲',
                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              _FilterList(),
            ],
          ),

          const Gap(10),

          ///学習状況
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '学習状況',
                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              _StatusCardList(
                goalValue: goalValue,
                correctValue: correctValue,
                incorrectValue: incorrectValue,
                learnedValue: learnedValue,
                unlearnedValue: unlearnedValue,
              ),
            ],
          ),
          const Gap(10),

          ///重要度
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '重要度',
                style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              _FilterList(),
            ],
          ),
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
    );
  }
}

class _SelectFilterButton extends HookConsumerWidget {
  const _SelectFilterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        children: [
          const Text(
            '73人に絞り込み中',
            style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          PrimaryButton(
            width: context.width * 1,
            height: 60,
            title: 'この条件で絞り込む',
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
              ref.read(homeQuizScreenProvider.notifier).setSelectStudyQuiz();
              final selectStudyQuiz = ref.read(homeQuizScreenProvider).selectStudyQuiz!;
              context.showScreen(
                QuizChoiceScreenArguments(
                  quiz: selectStudyQuiz,
                ).generateRoute(),
              );
            },
          ),
          Gap(context.height * 0.025),
        ],
      ),
    );
  }
}
