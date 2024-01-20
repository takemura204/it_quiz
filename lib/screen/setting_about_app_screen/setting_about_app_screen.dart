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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(30),
              SvgPicture.asset(
                'assets/image/about_app.svg',
                fit: BoxFit.fitWidth,
                width: context.width * 0.9,
              ),
              const Gap(30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'あなたの「好き」を、\nもっと豊かで素敵な日常に。',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'Thanks to all who installed our app. Your support drives our improvement.\nWe value you in our community. Your experience matters to us. \nThanks for joining our journey.',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              const Gap(100),
              SecondaryButton(
                  width: context.width,
                  height: 50,
                  text: '利用規約',
                  onPressed: () {
                    context.showScreen(const SettingUserPolicyScreenArguments()
                        .generateRoute());
                  }),
              const Gap(10),
              SecondaryButton(
                  width: context.width,
                  height: 50,
                  text: 'プライバシーポリシー',
                  onPressed: () {
                    context.showScreen(
                        const SettingPrivacyPolicyScreenArguments()
                            .generateRoute());
                  }),
              const Gap(10),
              SecondaryButton(
                  width: context.width,
                  height: 50,
                  text: 'バージョン・ライセンス',
                  onPressed: () {
                    context.showScreen(
                        const SettingLicenseScreenArguments().generateRoute());
                  }),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}
