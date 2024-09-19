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

class AccountCreateStep1Screen extends ConsumerWidget {
  const AccountCreateStep1Screen(this.arguments);

  final AccountCreateStep1ScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidEmail = ref.watch(authProvider).isValidEmail;
    final isSafetyPass = ref.watch(authProvider).isSafetyPass;
    final isObscure = ref.watch(authProvider).isObscure;
    final emailController = ref.watch(authProvider.notifier).emailController;
    final passwordController = ref.watch(authProvider.notifier).passwordController;
    final formKey = ref.watch(authProvider.notifier).createAccountFormKey1;
    final focusNode = ref.watch(authProvider.notifier).createFocusNode1;
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
                        onChanged: (email) => ref.read(authProvider.notifier).setEmail(email),
                      ),

                      ///パスワード
                      PasswordTextField(
                        passwordController: passwordController,
                        isValid: isValidEmail,
                        isSafetyPass: isSafetyPass,
                        isObscure: isObscure,
                        isLogin: false,
                        onChanged: (password) =>
                            ref.read(authProvider.notifier).setPassword(password),
                        obscureIconButtonPressed: () =>
                            ref.read(authProvider.notifier).switchObscure(),
                      ),
                      Gap(context.height * 0.02),

                      ///送信ボタン
                      PrimaryButton(
                        width: context.width * 0.8,
                        height: context.height * 0.07,
                        title: '新規登録',
                        onPressed: (isValidEmail && isSafetyPass) && !isNotTap
                            ? () {
                                ref.read(authProvider.notifier).switchTap();
                                ref.read(authProvider.notifier).signUp()
                                  ..then(
                                    (value) {
                                      //ログイン失敗
                                      if (value.hasError) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => SecondaryCloseDialog(
                                            onPressed: () {
                                              ref.read(authProvider.notifier).switchHasError();
                                              Navigator.of(context).pop();
                                            },
                                            title: "エラー",
                                            subWidget: Text(
                                              I18n().loginErrorText(value.errorText),
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: context.width * 0.035,
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
                                          const AccountCreateStep2ScreenArguments().generateRoute(),
                                        );
                                      }
                                      ref.read(authProvider.notifier).switchTap();
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
                      DefaultButton(
                          width: context.width * 0.8,
                          height: context.height * 0.07,
                          title: 'ログイン画面へ',
                          onPressed: () {
                            context.showScreen(const AccountLoginScreenArguments().generateRoute());
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
