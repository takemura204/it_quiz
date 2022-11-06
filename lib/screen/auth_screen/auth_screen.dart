import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/login/login_screen_controller.dart';
import '../../view/button.dart';

part 'auth_view.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen(this.arguments);
  final AuthScreenArguments arguments;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: ClearButton(
          iconSize: context.width * 0.1,
          onPressed: () =>
              ref.read(loginScreenControllerProvider.notifier).reset(),
        ),
      ),
      body: Column(
        children: [
          ///説明画面
          Container(
            color: Colors.redAccent,
            height: context.height * 0.4,
            child: const _Tutorial(),
          ),
          const Spacer(),

          ///認証方法選択
          Padding(
            padding: EdgeInsets.all(context.height * 0.02),
            child: Column(
              children: [
                ///ログインボタン
                SignInWithEmailButton(
                  text: 'ログイン',
                  onPressed: () => context.showScreen(
                    const LoginScreenArguments().generateRoute(),
                  ),
                ),

                Gap(context.height * 0.01),

                SignInWithEmailButton(
                  text: '新規会員登録',
                  onPressed: () => context.showScreen(
                    const CreateAccountScreenArguments().generateRoute(),
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
                  onPressed: () => ref
                      .read(loginScreenControllerProvider.notifier)
                      .signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () => ref
                      .read(loginScreenControllerProvider.notifier)
                      .signInWithGoogle(),
                ),
                SignInWithGoogleButton(
                  text: 'Googleアカウントで続ける',
                  onPressed: () => ref
                      .read(loginScreenControllerProvider.notifier)
                      .signInWithGoogle(),
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
