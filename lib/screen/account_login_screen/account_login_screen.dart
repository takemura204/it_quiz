import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/modals/dialog.dart';
import '../../view/text_field.dart';

part 'account_login_appbar.dart';

class AccountLoginScreen extends ConsumerWidget {
  const AccountLoginScreen(this.arguments);

  final AccountLoginScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSafetyPass = ref.watch(authProvider).isSafetyPass;
    final isObscure = ref.watch(authProvider).isObscure;
    final emailController = ref.watch(authProvider.notifier).emailController;
    final passwordController =
        ref.watch(authProvider.notifier).passwordController;
    final formKey = ref.watch(authProvider.notifier).loginFormKey;
    final focusNode = ref.watch(authProvider.notifier).loginFocusNode;
    final isNotTap = ref.watch(authProvider).isNotTap;
    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: const _AppBar(),
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

                      ///パスワード
                      PasswordTextField(
                        passwordController: passwordController,
                        isValid: passwordController.text.isNotEmpty,
                        isSafetyPass: isSafetyPass,
                        isObscure: isObscure,
                        isLogin: true,
                        onChanged: (password) => ref
                            .read(authProvider.notifier)
                            .setPassword(password),
                        obscureIconButtonPressed: () =>
                            ref.read(authProvider.notifier).switchObscure(),
                      ),
                    ],
                  ),
                ),

                Gap(context.height * 0.02),

                ///送信ボタン
                DefaultButton(
                  width: context.width * 0.8,
                  height: context.height * 0.07,
                  text: 'ログイン',
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
                                  builder: (_) => SecondaryCloseDialog(
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
                PrimaryButton(
                    width: context.width * 0.8,
                    height: context.height * 0.07,
                    title: '新規登録画面へ',
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
