import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/button/secondory_button.dart';

import '../../view/button_icon/cutom_back_button.dart';

class SettingAboutAppScreen extends ConsumerWidget {
  const SettingAboutAppScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("このアプリについて"),
        leading: CustomBackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Gap(30),
            SvgPicture.asset(
              'assets/image/about_app.svg',
              fit: BoxFit.fitWidth,
              width: context.width * 0.9,
            ),
            const Gap(150),
            SecondaryButton(
                width: context.width,
                height: 50,
                text: '利用規約',
                onPressed: () {
                  context.showScreen(
                      const SettingUserPolicyScreenArguments().generateRoute());
                }),
            const Gap(10),
            SecondaryButton(
                width: context.width,
                height: 50,
                text: 'プライバシーポリシー',
                onPressed: () {
                  context.showScreen(const SettingPrivacyPolicyScreenArguments()
                      .generateRoute());
                }),
          ],
        ),
      ),
    );
  }
}
