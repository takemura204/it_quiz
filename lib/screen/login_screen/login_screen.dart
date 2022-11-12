import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/login/login_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/bar.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

part 'login_appbar.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen(this.arguments);
  final LoginScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail = ref.watch(loginScreenControllerProvider).isValidEmail;
    final isSafetyPass = ref.watch(loginScreenControllerProvider).isSafetyPass;
    final isObscure = ref.watch(loginScreenControllerProvider).isObscure;
    final emailController =
        ref.watch(loginScreenControllerProvider.notifier).emailController;
    final passwordController =
        ref.watch(loginScreenControllerProvider.notifier).passwordController;
    final formKey = ref.watch(loginScreenControllerProvider.notifier).formKey;
    final focusNode =
        ref.watch(loginScreenControllerProvider.notifier).focusNode;
    final hasError = ref.watch(loginScreenControllerProvider).hasError;
    final errorText = ref.watch(loginScreenControllerProvider).errorText;

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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if (hasError)
                        LoginErrorBar(
                            errorText: I18n().loginErrorText(errorText))
                      else
                        const Gap(0),
                      const Gap(20),

                      ///メールアドレス
                      EmailTextField(
                        emailController: emailController,
                        isValidEmail: isValidEmail,
                        onChanged: (email) => ref
                            .read(loginScreenControllerProvider.notifier)
                            .setEmail(email),
                      ),
                      const Gap(20),

                      ///パスワード
                      PasswordTextField(
                        passwordController: passwordController,
                        isValidEmail: isValidEmail,
                        isSafetyPass: isSafetyPass,
                        isObscure: isObscure,
                        onChanged: (password) => ref
                            .read(loginScreenControllerProvider.notifier)
                            .setPassword(password),
                        obscureIconButtonPressed: () => ref
                            .read(loginScreenControllerProvider.notifier)
                            .switchObscure(),
                      ),
                    ],
                  ),
                ),

                const Align(
                    alignment: Alignment.centerRight,
                    child: Text("パスワードを忘れた場合")),
                const Gap(10),

                ///送信ボタン
                Container(
                  width: context.width * 0.8,
                  height: context.height * 0.06,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent.shade700,
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'ログイン',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: isValidEmail && isSafetyPass
                        ? () {
                            ref
                                .read(loginScreenControllerProvider.notifier)
                                .signIn();
                            showDialog(
                                context: context,
                                builder: (_) => ResultDialog(
                                      title: "a",
                                      content: I18n().loginErrorText(errorText),
                                    ));
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
