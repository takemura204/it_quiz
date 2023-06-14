import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_screen_controller.dart';
import '../../view/button.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          ///説明画面

          const Spacer(),

          ///認証方法選択
          Padding(
            padding: EdgeInsets.all(context.height * 0.02),
            child: Column(
              children: [
                ///ログインボタン
                Default2Button(
                  text: 'ログイン',
                  onPressed: () => context.showScreen(
                    const AccountLoginScreenArguments().generateRoute(),
                  ),
                ),

                Gap(context.height * 0.012),

                Default1Button(
                  text: '新規会員登録',
                  onPressed: () => context.showScreen(
                    const AccountCreateStep1ScreenArguments().generateRoute(),
                  ),
                ),

                Gap(context.height * 0.01),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      "または",
                      style: TextStyle(
                        fontSize: context.height * 0.018,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                ///Googleから登録
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authScreenProvider.notifier).signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authScreenProvider.notifier).signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () =>
                      ref.read(authScreenProvider.notifier).signInWithGoogle(),
                ),

                Gap(context.height * 0.015),

                Text(
                  "登録することで 利用規約 と プライバシーポリシー に同意することになります",
                  style: TextStyle(
                    fontSize: context.height * 0.01,
                  ),
                ),
                Gap(context.height * 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
