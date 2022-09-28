import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/text_field.dart';

import '../../controller/create_account/create_account_screen_controller.dart';

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

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: AppBar(
            title: const Text("会員登録"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
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

                const Gap(20),

                const Text("パスワードを忘れた場合"),
                const Text("新規登録画面"),
                const Text("端末に保存"),
                const Text("利用規約に同意"),

                ///登録ボタン
                ElevatedButton(
                  child: const Text('新規登録'),
                  onPressed: isValidEmail && isSafetyPass
                      ? () async {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                          } catch (e) {
                            print(e);
                          }
                        }
                      : null,
                ),

                ///Googleから登録
                Container(
                  width: context.width * 0.75,
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
                          style: TextStyle(color: Colors.black54),
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
