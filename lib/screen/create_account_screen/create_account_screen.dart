import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/bar.dart';
import 'package:kentei_quiz/view/text_field.dart';

import '../../controller/create_account/create_account_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';

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
    final isCheck = ref.watch(createAccountScreenControllerProvider).isCheck;

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
            title: const Text("会員登録"),
            leading: CustomBackButton(
              iconSize: 25,
              onPressed: () => ref
                  .read(createAccountScreenControllerProvider.notifier)
                  .reset(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                if (hasError)
                  LoginErrorBar(errorText: I18n().loginErrorText(errorText))
                else
                  const Gap(0),

                const Gap(20),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///メールアドレス
                      EmailTextField(
                        emailController: emailController,
                        isValidEmail: isValidEmail,
                        onChanged: (email) => ref
                            .read(
                                createAccountScreenControllerProvider.notifier)
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
                            .read(
                                createAccountScreenControllerProvider.notifier)
                            .setPassword(password),
                        obscureIconButtonPressed: () => ref
                            .read(
                                createAccountScreenControllerProvider.notifier)
                            .switchObscure(),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    const Text("利用規約、個人情報保護方針に同意"),
                    CheckBoxIconButton(
                      onPressed: () => ref
                          .read(createAccountScreenControllerProvider.notifier)
                          .switchIsCheck(),
                      isCheck: isCheck,
                    ),
                  ],
                ),

                const Gap(10),

                ///登録ボタン
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
                      '新規登録',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: isValidEmail && isSafetyPass && isCheck
                        ? () => ref
                            .read(
                                createAccountScreenControllerProvider.notifier)
                            .signUp()
                        : null,
                  ),
                ),

                const Divider(),

                ///Googleから登録
                Container(
                  width: context.width * 0.8,
                  height: context.height * 0.06,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                            width: context.width * 0.1,
                            height: context.height * 0.03,
                            child: Image.asset(
                              'assets/icon/Google_icon.png',
                              fit: BoxFit.contain,
                            )),
                        const Spacer(),
                        const Text(
                          'Googleアカウントでサインイン',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    onPressed: () async => ref
                        .read(createAccountScreenControllerProvider.notifier)
                        .signInWithGoogle(),
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
