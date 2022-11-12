import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/bar.dart';

import '../../controller/registration/registration_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/text_field.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen(this.arguments);

  final RegistrationScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail =
        ref.watch(registrationScreenControllerProvider).isValidEmail;
    final isSafetyPass =
        ref.watch(registrationScreenControllerProvider).isSafetyPass;
    final isObscure = ref.watch(registrationScreenControllerProvider).isObscure;
    final hasError = ref.watch(registrationScreenControllerProvider).hasError;
    final emailController = ref
        .watch(registrationScreenControllerProvider.notifier)
        .emailController;
    final passwordController = ref
        .watch(registrationScreenControllerProvider.notifier)
        .passwordController;
    final formKey =
        ref.watch(registrationScreenControllerProvider.notifier).formKey;
    final focusNode =
        ref.watch(registrationScreenControllerProvider.notifier).focusNode;
    final errorText = ref.watch(registrationScreenControllerProvider).errorText;

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
            title: const Text("新規登録"),
            leading: CustomBackButton(
              iconSize: 25,
              onPressed: () => ref
                  .read(registrationScreenControllerProvider.notifier)
                  .reset(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (hasError)
                    LoginErrorBar(errorText: I18n().loginErrorText(errorText))
                  else
                    const Gap(0),

                  const Gap(20),

                  ///メールアドレス
                  EmailTextField(
                    emailController: emailController,
                    isValidEmail: isValidEmail,
                    onChanged: (email) => ref
                        .read(registrationScreenControllerProvider.notifier)
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
                        .read(registrationScreenControllerProvider.notifier)
                        .setPassword(password),
                    obscureIconButtonPressed: () => ref
                        .read(registrationScreenControllerProvider.notifier)
                        .switchObscure(),
                  ),
                  const Gap(3),

                  /// パスワードを忘れた場合
                  Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          "パスワードを忘れた場合",
                          style: TextStyle(
                            fontSize: context.height * 0.015,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),

                  ///ログインボタン
                  SignInWithEmailButton(
                    text: 'メールアドレスで続ける',
                    onPressed: isValidEmail && isSafetyPass
                        ? () => ref
                            .read(registrationScreenControllerProvider.notifier)
                            .signUp()
                        : null,
                  ),

                  const Gap(20),

                  Text(
                    "登録することで 利用規約 と プライバシーポリシー に同意することになります",
                    style: TextStyle(
                      fontSize: context.height * 0.01,
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
