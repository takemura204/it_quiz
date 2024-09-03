import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
import '../../controller/main/main_screen_controller.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/card/result_clear_card.dart';
import '../../view/card/result_dashboard_card.dart';
import '../../view/card/result_item_card.dart';
import '../../view/modals/study_modal/study_modal.dart';

part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/next_action_buttons.dart';
part 'widget/result_item_list.dart';

class QuizResultScreen extends HookConsumerWidget {
  const QuizResultScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider.select((s) => s.studyType));
    List<QuizItem> quizItemList(StudyType studyType) {
      switch (studyType) {
        case StudyType.study:
          return ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
        case StudyType.learn:
          return ref.watch(quizLearnScreenProvider.select((s) => s.quizItemList));
        case StudyType.choice:
          return ref.watch(quizChoiceScreenProvider.select((s) => s.quizItemList));
        default:
          return [];
      }
    }

    Duration duration(StudyType studyType) {
      switch (studyType) {
        case StudyType.study:
          return ref.watch(homeStudyScreenProvider.select((s) => s.duration));
        case StudyType.learn:
          return ref.watch(quizLearnScreenProvider.select((s) => s.duration));
        case StudyType.choice:
          return ref.watch(quizChoiceScreenProvider.select((s) => s.duration));
        default:
          return Duration.zero;
      }
    }

    return Scaffold(
      appBar: const _AppBar(),
      body: _Body(quizItemList(studyType), duration(studyType)),
    );
  }
}
