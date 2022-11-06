import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/bar.dart';

import '../../controller/create_account/create_account_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/text_field.dart';

class CreateAccountScreen extends ConsumerWidget {
  const CreateAccountScreen(this.arguments);

  final CreateAccountScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail =
        ref.watch(createAccountScreenControllerProvider).isValidEmail;
    final isSafetyPass =
        ref.watch(createAccountScreenControllerProvider).isSafetyPass;
    final isObscure =
        ref.watch(createAccountScreenControllerProvider).isObscure;
    final hasError = ref.watch(createAccountScreenControllerProvider).hasError;
    final emailController = ref
        .watch(createAccountScreenControllerProvider.notifier)
        .emailController;
    final passwordController = ref
        .watch(createAccountScreenControllerProvider.notifier)
        .passwordController;
    final formKey =
        ref.watch(createAccountScreenControllerProvider.notifier).formKey;
    final focusNode =
        ref.watch(createAccountScreenControllerProvider.notifier).focusNode;
    final errorText =
        ref.watch(createAccountScreenControllerProvider).errorText;

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
                  .read(createAccountScreenControllerProvider.notifier)
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
                        .read(createAccountScreenControllerProvider.notifier)
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
                        .read(createAccountScreenControllerProvider.notifier)
                        .setPassword(password),
                    obscureIconButtonPressed: () => ref
                        .read(createAccountScreenControllerProvider.notifier)
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
                            .read(
                                createAccountScreenControllerProvider.notifier)
                            .signUp()
                        : null,
                  ),

                  const Gap(10),

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

                  const Gap(5),

                  ///Googleから登録
                  SignInWithGoogleButton(
                    text: 'Googleアカウントで続ける',
                    onPressed: () => ref
                        .read(createAccountScreenControllerProvider.notifier)
                        .signInWithGoogle(),
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
