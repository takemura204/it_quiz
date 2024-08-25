import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study_modal/home_study_modal_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/view/tag/category_tag.dart';
import 'package:kentei_quiz/view/tag/importance_tag.dart';
import 'package:kentei_quiz/view/tag/status_tag.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/home_study/home_study_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/button_icon/save_button.dart';
import '../../view/card/quiz_item_card.dart';
import '../../view/card/result_clear_card.dart';
import '../../view/card/result_dashboard_card.dart';
import '../../view/chart/dotted_line_painter.dart';
import '../../view/modals/dialog.dart';
import '../../view/modals/study_modal/study_modal.dart';

part 'widget/action_buttons.dart';
part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/progress_bar.dart';
part 'widget/progress_tile.dart';
part 'widget/question.dart';
part 'widget/quz_item_card.dart';
part 'widget/result_list.dart';

class HomeStudyScreen extends HookConsumerWidget {
  const HomeStudyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowCancelModal = ref.watch(homeStudyModalProvider.select((s) => s.isShowCancelModal));
    Future.delayed(Duration.zero, () async {
      if (isShowCancelModal) {
        ref.read(homeStudyModalProvider.notifier).setIsShowCancelModal(false);
        await showDialog(
            context: context,
            builder: (context) {
              return PrimaryDialog(
                onPressed: () {
                  ref.read(homeStudyModalProvider.notifier).resetFilterQuizList();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                title: "学習を中断しますか？",
                subWidget: Text(
                  "学習を中断すると\nこれまでの内容は保存されません。",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: context.width * 0.04, color: Colors.black87),
                  maxLines: 2,
                ),
                cancelText: "続ける",
                doneText: "中断する",
              );
            });
      }
    });
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}
