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

part 'account_create_view.dart';

class AccountCreateStep1Screen extends ConsumerWidget {
  const AccountCreateStep1Screen(this.arguments);

  final AccountCreateStep1ScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail = ref.watch(authScreenProvider).isValidEmail;
    final isSafetyPass = ref.watch(authScreenProvider).isSafetyPass;
    final isObscure = ref.watch(authScreenProvider).isObscure;
    final emailController =
        ref.watch(authScreenProvider.notifier).emailController;
    final passwordController =
        ref.watch(authScreenProvider.notifier).passwordController;
    final formKey =
        ref.watch(authScreenProvider.notifier).createAccountFormKey1;
    final focusNode = ref.watch(authScreenProvider.notifier).createFocusNode1;
    final isNotTap = ref.watch(authScreenProvider).isNotTap;
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
              onPressed: () {
                // ref.read(authScreenProvider.notifier).reset();
                Navigator.pop(context);
              },
            ),
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
                        isValidEmail: isValidEmail,
                        onChanged: (email) => ref
                            .read(authScreenProvider.notifier)
                            .setEmail(email),
                      ),

                      ///パスワード
                      PasswordTextField(
                        passwordController: passwordController,
                        isValidEmail: isValidEmail,
                        isSafetyPass: isSafetyPass,
                        isObscure: isObscure,
                        isLogin: false,
                        onChanged: (password) => ref
                            .read(authScreenProvider.notifier)
                            .setPassword(password),
                        obscureIconButtonPressed: () => ref
                            .read(authScreenProvider.notifier)
                            .switchObscure(),
                      ),
                      Gap(context.height * 0.02),

                      ///送信ボタン
                      Default2Button(
                        text: '新規登録',
                        onPressed: (isValidEmail && isSafetyPass) && !isNotTap
                            ? () {
                                ref
                                    .read(authScreenProvider.notifier)
                                    .switchTap();
                                ref.read(authScreenProvider.notifier).signUp()
                                  ..then(
                                    (value) {
                                      //ログイン失敗
                                      if (value.hasError) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => DialogClose2(
                                            onPressed: () {
                                              ref
                                                  .read(authScreenProvider
                                                      .notifier)
                                                  .switchHasError();
                                              Navigator.of(context).pop();
                                            },
                                            title: "エラー",
                                            subWidget: Text(
                                              I18n().loginErrorText(
                                                  value.errorText),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize:
                                                      context.width * 0.035,
                                                  color: Colors.black87),
                                              maxLines: 2,
                                            ),
                                            doneText: "OK",
                                          ),
                                        );
                                      }
                                      //ログイン成功
                                      else {
                                        Navigator.pop(context);
                                        context.showScreen(
                                          const AccountCreateStep2ScreenArguments()
                                              .generateRoute(),
                                        );
                                      }
                                      ref
                                          .read(authScreenProvider.notifier)
                                          .switchTap();
                                    },
                                  );
                              }
                            : null,
                      ),

                      Gap(context.height * 0.01),

                      Text(
                        "登録することで 利用規約 と プライバシーポリシー に同意することになります",
                        style: TextStyle(
                          fontSize: context.height * 0.01,
                        ),
                      ),

                      Gap(context.height * 0.1),

                      ///区切り線
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Text(
                            'アカウントをお持ちの方はこちら',
                            style: TextStyle(
                              fontSize: context.height * 0.017,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),

                      Gap(context.height * 0.025),

                      ///ログイン画面
                      Default1Button(
                          text: 'ログイン画面へ',
                          onPressed: () {
                            context.showScreen(
                                const AccountLoginScreenArguments()
                                    .generateRoute());
                          }),
                    ],
                  ),
                ),
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
