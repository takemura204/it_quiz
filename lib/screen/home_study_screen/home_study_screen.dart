import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study_modal/home_study_modal_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/tag/category_tag.dart';
import 'package:kentei_quiz/view/tag/importance_tag.dart';
import 'package:kentei_quiz/view/tag/status_tag.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/animation_image.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/button_icon/save_button.dart';
import '../../view/chart/dotted_line_painter.dart';
import '../../view/modals/study_modal/study_modal.dart';

part 'widget/action_buttons.dart';
part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/progress_bar.dart';
part 'widget/progress_tile.dart';
part 'widget/question.dart';
part 'widget/quiz_item_card.dart';

class HomeStudyScreen extends HookConsumerWidget {
  const HomeStudyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(homeStudyScreenProvider.select((s) => s.isResultScreen));
    final isFinishView = ref.watch(homeStudyScreenProvider.select((s) => s.isFinishView));
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final duration = ref.watch(homeStudyScreenProvider.select((s) => s.duration));
    Future.delayed(Duration.zero, () async {
      if (isResultScreen) {
        // ref.read(homeStudyScreenProvider.notifier).setIsResultView(false);
        context.showScreen(QuizResultScreenArguments(quizItemList, duration).generateRoute());
      }
    });
    return Scaffold(
      appBar: const _AppBar(),
      body: isFinishView ? const _FinishBody() : const _ChallengeBody(),
    );
  }
}
