import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/main/main_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/card/result_dashboard_card.dart';
import 'package:kentei_quiz/view/card/result_prefect_card.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/user/auth_model.dart';
import '../../untils/enums.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/button_icon/contact_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/card/result_good_card.dart';
import '../../view/card/result_item_card.dart';
import '../../view/card/result_try_card.dart';
import '../../view/modals/dialog.dart';
import '../screen_argument.dart';

part 'choice_challenge/choice_challenge_body.dart';
part 'choice_challenge/choice_challenge_view.dart';
part 'choice_result/choice_result_body.dart';
part 'choice_result/choice_result_view.dart';

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
    ///クイズ画面
    return Scaffold(
      appBar: _AppBar(quiz),
      body: _Body(quiz),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
    return isResultScreen
        ? AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("結果"),
            actions: [
              ClearButton(
                iconSize: 30,
                onPressed: () {
                  //問題リセット
                  ref.read(quizChoiceScreenProvider.notifier).resetScreen();
                  ref.read(mainScreenControllerProvider.notifier).setIsShowInAppReview();
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        : AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(quiz.title),
            leading: CustomBackButton(onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return PrimaryDialog(
                      onPressed: () {
                        ref.read(quizChoiceScreenProvider.notifier).resetScreen();
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
            }),
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
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
    return isResultScreen ? _ChoiceResultBody(quiz) : ChoiceChallengeBody(quiz);
  }
}
