import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/login_screen/login_screen_controller.dart';

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

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          resizeToAvoidBottomInset: false, //キーボードによって画面サイズを変更させないため
          appBar: AppBar(
            title: const Text("ログイン"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Form(
                  key: formKey,

                  ///メールアドレス
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        autofocus: true, //TextFieldに自動でfocusを当てる
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            isValidEmail ? null : '無効なメールアドレスです',
                        enabled: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          ref
                              .read(loginScreenControllerProvider.notifier)
                              .setEmail(email);
                        },
                        textInputAction:
                            TextInputAction.next, //次のTextFieldへ自動でfocusを移す
                        maxLines: 1,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF8FAFA),
                          hintMaxLines: null,
                          hintText: 'Email',
                          labelText: "メールアドレス",
                          prefixIcon: Icon(Icons.mail),
                        ),
                        obscureText: false,
                      ),
                      const Gap(20),

                      ///パスワード
                      TextFormField(
                        controller: passwordController,
                        enabled: true,
                        keyboardType: TextInputType.visiblePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) =>
                            isSafetyPass ? null : '6文字以上の英数字に設定してください',
                        onChanged: (password) {
                          ref
                              .read(loginScreenControllerProvider.notifier)
                              .setPassword(password);
                        },
                        minLines: null,
                        maxLines: 1,
                        obscureText: isObscure, //入力非表示
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffF8FAFA),
                          hintMaxLines: null,
                          hintText: 'Password',
                          labelText: "パスワード(6文字以上)",
                          prefixIcon: const Icon(Icons.key),
                          suffixIcon: IconButton(
                            onPressed: () => ref
                                .read(loginScreenControllerProvider.notifier)
                                .switchObscure(),
                            // 表示アイコン
                            icon: isObscure
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            color:
                                isObscure ? Colors.grey : context.colors.main50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),

                const Text("パスワードを忘れた場合"),
                const Text("新規登録画面"),
                const Text("端末に保存"),
                const Text("利用規約に同意"),

                ///送信ボタン
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

                            const snackBar = SnackBar(
                              content: Text('Success!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                          Radius.circular(25),
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
                        .read(loginScreenControllerProvider.notifier)
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
