import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/screen/quiz_result_screen/quiz_result_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button_icon/contact_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/button_icon/save_button.dart';
import '../../view/modals/dialog.dart';
import '../../view/tag/category_tag.dart';
import '../../view/tag/importance_tag.dart';
import '../../view/tag/status_tag.dart';

part 'widget/action_buttons.dart';
part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/progress_bar.dart';
part 'widget/progress_tile.dart';
part 'widget/question.dart';
part 'widget/quiz_item_card.dart';

class QuizLearnScreen extends ConsumerWidget {
  const QuizLearnScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizLearnScreenProvider.overrideWith(
          (ref) => QuizLearnScreenController(ref: ref, quiz: quiz),
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
    final isResultScreen = ref.watch(quizLearnScreenProvider.select((s) => s.isResultScreen));
    final quizItemList = ref.watch(quizLearnScreenProvider.select((s) => s.quizItemList));
    final duration = ref.watch(quizLearnScreenProvider.select((s) => s.duration));
    return isResultScreen
        ? QuizResultScreen(quizItemList, duration)
        : Scaffold(appBar: _AppBar(quiz), body: _Body(quiz));
  }
}
