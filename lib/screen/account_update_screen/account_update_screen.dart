import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

class AccountUpdateScreen extends ConsumerWidget {
  const AccountUpdateScreen(this.arguments);
  final AccountUpdateScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(authProvider.notifier).emailController;
    final passwordController =
        ref.watch(authProvider.notifier).passwordController;
    final formKey = ref.watch(authProvider.notifier).updateFormKey;
    final focusNode = ref.watch(authProvider.notifier).updateFocusNode;
    final isNotTap = ref.watch(authProvider).isNotTap;
    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("パスワード再設定"),
            leading: CustomBackButton(onPressed: () {
              Navigator.pop(context);
            }),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Column(
              children: [
                const Spacer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///メールアドレス
                      EmailTextField(
                        emailController: emailController,
                        isValidEmail: emailController.text.isNotEmpty,
                        onChanged: (email) =>
                            ref.read(authProvider.notifier).setEmail(email),
                      ),
                    ],
                  ),
                ),

                Gap(context.height * 0.02),

                ///送信ボタン
                Default1Button(
                  text: '再設定する',
                  onPressed: emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty &&
                          !isNotTap
                      ? () {
                          ref.read(authProvider.notifier).switchTap();
                          ref.read(authProvider.notifier).signIn()
                            ..then((value) {
                              //ログイン失敗
                              if (value.hasError) {
                                showDialog(
                                  context: context,
                                  builder: (_) => DialogClose2(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    title: "エラー",
                                    subWidget: Text(
                                      I18n().loginErrorText(value.errorText),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: context.width * 0.035,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    doneText: "OK",
                                  ),
                                );
                              }
                              //ログイン成功
                              else {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              }
                              ref.read(authProvider.notifier).switchTap();
                            });
                        }
                      : null,
                ),

                // ///ソーシャルログイン
                // const _SocialLogin(),
                Gap(context.height * 0.1),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      'アカウントをお持ちでない方はこちら',
                      style: TextStyle(
                        fontSize: context.height * 0.017,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                Gap(context.height * 0.025),

                ///新規登録画面へ
                Default2Button(
                    text: '新規登録画面へ',
                    onPressed: () {
                      Navigator.pop(context);
                      // ref.read(authScreenProvider.notifier).reset();
                    }),
                const Spacer(),
                Gap(context.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
