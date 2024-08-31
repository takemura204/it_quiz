import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
import '../../controller/home_study_modal/home_study_modal_controller.dart';
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
  const QuizResultScreen(this.quizItemList);

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const _AppBar(),
      body: _Body(quizItemList),
    );
  }
}
