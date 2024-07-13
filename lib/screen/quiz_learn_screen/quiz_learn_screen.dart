import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/view/card/result_clear_card.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/main/main_screen_controller.dart';
import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../controller/tutorial/tutorial_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/button_icon/contact_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/button_icon/save_button.dart';
import '../../view/card/quiz_item_card.dart';
import '../../view/card/result_dashboard_card.dart';
import '../../view/modals/dialog.dart';
import '../../view/tutorial/animation_image.dart';
import '../screen_argument.dart';

part 'learn_challenge/learn_challenge_body.dart';
part 'learn_challenge/learn_challenge_view.dart';
part 'learn_result/learn_result_body.dart';
part 'learn_result/learn_result_view.dart';

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
    return Stack(
      children: [
        Scaffold(appBar: _AppBar(quiz), body: _Body(quiz)),
      ],
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;
    final learnResultTarget4 =
        ref.read(tutorialControllerProvider.notifier).learnResultTarget4;
    final isShowTutorialModal = ref.watch(
        mainScreenControllerProvider.select((s) => s.isShowTutorialModal));
    return isResultScreen
        ? AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Text("結果"),
            actions: [
              Container(
                key: learnResultTarget4,
                child: ClearButton(
                    iconSize: 30,
                    onPressed: () {
                      ref
                          .read(quizLearnScreenProvider.notifier)
                          .updateHistoryQuiz();

                      ref
                          .read(quizLearnScreenProvider.notifier)
                          .tapClearButton();
                    }),
              ),
            ],
          )
        : AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(quiz.title),
            leading: !isShowTutorialModal
                ? CustomBackButton(onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return PrimaryDialog(
                            onPressed: () {
                              ref
                                  .read(quizLearnScreenProvider.notifier)
                                  .tapClearButton();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            title: "学習を中断しますか？",
                            subWidget: Text(
                              "学習を中断すると\nこれまでの内容は保存されません。",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: context.width * 0.04,
                                  color: Colors.black87),
                              maxLines: 2,
                            ),
                            cancelText: "続ける",
                            doneText: "中断する",
                          );
                        });
                  })
                : Container(),
            actions: const [
              ContactIconButton(),
            ],
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (isResultScreen)
          _LearnResultBody(quiz)
        else
          _LearnChallengeBody(quiz),
      ],
    );
  }
}
