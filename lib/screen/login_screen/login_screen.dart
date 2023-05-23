import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

part 'login_appbar.dart';
part 'login_view.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen(this.arguments);
  final LoginScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail = ref.watch(authScreenControllerProvider).isValidEmail;
    final isSafetyPass = ref.watch(authScreenControllerProvider).isSafetyPass;
    final isObscure = ref.watch(authScreenControllerProvider).isObscure;
    final emailController =
        ref.watch(authScreenControllerProvider.notifier).emailController;
    final passwordController =
        ref.watch(authScreenControllerProvider.notifier).passwordController;
    final formKey =
        ref.watch(authScreenControllerProvider.notifier).loginFormKey;
    final focusNode =
        ref.watch(authScreenControllerProvider.notifier).loginFocusNode;
    final isNotTap = ref.watch(authScreenControllerProvider).isNotTap;
    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: const _AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
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
                        isValidEmail: isValidEmail,
                        onChanged: (email) => ref
                            .read(authScreenControllerProvider.notifier)
                            .setEmail(email),
                      ),

                      const Gap(10),

                      ///パスワード
                      Stack(
                        children: [
                          PasswordTextField(
                            passwordController: passwordController,
                            isValidEmail: isValidEmail,
                            isSafetyPass: isSafetyPass,
                            isObscure: isObscure,
                            onChanged: (password) => ref
                                .read(authScreenControllerProvider.notifier)
                                .setPassword(password),
                            obscureIconButtonPressed: () => ref
                                .read(authScreenControllerProvider.notifier)
                                .switchObscure(),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              height: context.height * 0.1,
                              child: const Text("パスワードを忘れた場合")),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(20),

                ///送信ボタン
                LoginWithEmailButton(
                  text: 'ログイン',
                  onPressed: isValidEmail && isSafetyPass && !isNotTap
                      ? () {
                          ref
                              .read(authScreenControllerProvider.notifier)
                              .switchTap();
                          ref
                              .read(authScreenControllerProvider.notifier)
                              .signIn()
                            ..then((value) {
                              //ログイン失敗
                              if (value.hasError) {
                                showDialog(
                                  context: context,
                                  builder: (_) => DialogError(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    title: "エラー",
                                    subTitle:
                                        I18n().loginErrorText(value.errorText),
                                  ),
                                );
                              }
                              //ログイン成功
                              else {
                                Navigator.of(context).pop();
                              }
                              ref
                                  .read(authScreenControllerProvider.notifier)
                                  .switchTap();
                            });
                        }
                      : null,
                ),
                const Gap(20),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      "または",
                      style: TextStyle(
                        fontSize: context.height * 0.02,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const Gap(10),

                ///ソーシャルログイン
                const _SocialLogin(),

                const Gap(30),

                ///区切り線
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      '会員登録をしていない方',
                      style: TextStyle(
                        fontSize: context.height * 0.02,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),

                const Gap(20),

                ///新規会員登録画面
                CreateAccountWithEmailButton(
                    text: '新規会員登録',
                    onPressed: () {
                      context.showScreen(
                        const CreateAccountScreenArguments().generateRoute(),
                      );
                      ref.read(authScreenControllerProvider.notifier).reset();
                    }),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
