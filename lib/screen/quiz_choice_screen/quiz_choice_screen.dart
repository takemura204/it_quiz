import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/contact_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/card/result_item_card.dart';
import '../../view/modals/dialog.dart';
import '../quiz_result_screen/quiz_result_screen.dart';
import '../screen_argument.dart';

part 'choice_result/choice_result_view.dart';

part 'widget/app_bar.dart';

part 'widget/body.dart';

part 'widget/choice_list.dart';

part 'widget/judge_ans.dart';

part 'widget/quiz_item_card.dart';

class QuizChoiceScreen extends ConsumerWidget {
  const QuizChoiceScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizChoiceScreenProvider.overrideWith(
          (ref) => QuizChoiceScreenController(ref: ref, quiz: quiz),
        ),
      ],
      child: _Scaffold(quiz),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizChoiceScreenProvider.select((s) => s.isResultScreen));
    final quizItemList = ref.watch(quizChoiceScreenProvider.select((s) => s.quizItemList));
    final duration = ref.watch(quizChoiceScreenProvider.select((s) => s.duration));
    return isResultScreen
        ? QuizResultScreen(quizItemList, duration)
        : Scaffold(appBar: _AppBar(quiz), body: _Body(quiz));
  }
}
