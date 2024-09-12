import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/controller/quiz_learn/quiz_learn_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
import '../../controller/main/main_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/card/result_item_card.dart';
import '../../view/modals/study_modal/study_modal.dart';
import '../screen_argument.dart';

part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/next_action_buttons.dart';
part 'widget/result_dashboard_card.dart';
part 'widget/result_header_card.dart';
part 'widget/result_item_list.dart';

class QuizResultScreen extends HookConsumerWidget {
  const QuizResultScreen(this.quizItemList, this.duration);

  final List<QuizItem> quizItemList;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const _AppBar(),
      body: _Body(quizItemList, duration),
    );
  }
}
