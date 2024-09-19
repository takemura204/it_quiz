import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/main/main_screen_controller.dart';
import 'package:kentei_quiz/controller/tutorial/tutorial_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../button/animation_shadow_button.dart';

///チュートリアルモーダル
class TutorialModal extends ConsumerWidget {
  const TutorialModal({required this.mainContext});

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTutorialRestart =
        ref.watch(tutorialControllerProvider.select((s) => s.isTutorialRestart));
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.02),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          padding: EdgeInsets.all(context.width * 0.01),
          margin: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(10),
              const Text(
                'インストールありがとうございます！🎉',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),

              const Gap(15),
              SvgPicture.asset(
                'assets/image/about_app.svg',
                width: context.width * 0.85,
                fit: BoxFit.fitWidth,
              ),
              const Gap(20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '＼　',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                          text: '1分で',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 16,
                          )),
                      TextSpan(
                        text: '効率よく学べます！',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '　／',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(10),

              ///ボタン
              AnimatedShadowButton(
                width: context.width,
                height: 60,
                title: "チュートリアルを開始！",
                onPressed: () {
                  Navigator.of(context).pop();
                  if (isTutorialRestart) {
                    ref.read(mainScreenControllerProvider.notifier).setTabIndex(0);
                  }
                  ref.read(tutorialControllerProvider.notifier).setIsShowHomeTutorial(true);
                  ref.read(homeQuizScreenProvider.notifier).setStudyQuizLength(5);
                },
              ),

              const Gap(5),
              TextButton(
                child: const Text(
                  "スキップ",
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  ref.read(tutorialControllerProvider.notifier).setIsTutorialRestart(false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
