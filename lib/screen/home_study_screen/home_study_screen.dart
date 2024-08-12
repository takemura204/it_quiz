import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study_modal/home_study_modal_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
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
import '../../view/chart/dotted_line_painter.dart';
import '../../view/modals/dialog.dart';
import '../../view/modals/study_modal/study_modal.dart';

part 'widget/action_buttons.dart';
part 'widget/progress_bar.dart';
part 'widget/progress_tile.dart';
part 'widget/question.dart';
part 'widget/quz_item_card.dart';

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

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///プログレスバー
        _QuizItemProgressBar(),
        Gap(10),

        ///何周目か確認
        _ProgressTile(),

        ///問題
        _QuizItemCard(),

        ///知っている・知らないボタン
        _ActionButtons(),

        Gap(15),

        ///広告
        AdBanner(),
      ],
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowTutorial = ref.watch(homeStudyScreenProvider.select((s) => s.isShowTutorial));
    final quizList = ref.watch(homeStudyScreenProvider.notifier).getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filterQuizList = ref.watch(homeStudyModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = quizItemList.length == filterQuizItemList.length;
    return AppBar(
      title: Text(I18n().titleName),
      centerTitle: true,
      actions: [
        Container(
          child: IconButton(
            iconSize: 32,
            padding: EdgeInsets.zero,
            onPressed: () {
              ref.read(homeStudyScreenProvider.notifier).setIsShowTutorial(!isShowTutorial);
              HapticFeedback.lightImpact();
            },
            icon: const Icon(
              LineIcons.questionCircle,
              size: 32,
              color: Colors.black54,
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            showStudyModal(context);
            HapticFeedback.lightImpact();
          },
          icon: Icon(
            LineIcons.horizontalSliders,
            size: 32,
            color: isFiltered ? Colors.black54 : context.mainColor,
          ),
        ),
        Gap(context.width * 0.01),
      ],
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
