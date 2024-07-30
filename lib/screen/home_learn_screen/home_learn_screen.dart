import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_learn/home_learn_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/button_icon/save_button.dart';
import '../screen_argument.dart';

part 'widget/action_buttons.dart';
part 'widget/body.dart';
part 'widget/question.dart';
part 'widget/quz_item_card.dart';

class HomeLearnScreen extends HookConsumerWidget {
  const HomeLearnScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(I18n().titleName),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: IconButton(
            onPressed: () {
              context.showScreen(
                const QuizHistoryScreenArguments().generateRoute(),
              );
              HapticFeedback.lightImpact();
            },
            icon: Icon(
              LineIcons.horizontalSliders,
              size: 32,
              color: context.defaultColor,
            ),
          ),
        ),
      ],
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
