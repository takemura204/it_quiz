import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/home_setting_screen/home_setting_screen.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

part 'create_account_view.dart';

class CreateAccountScreen extends ConsumerWidget {
  const CreateAccountScreen(this.arguments);

  final CreateAccountScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidUserName =
        ref.watch(authScreenControllerProvider).isValidUserName;
    final isValidEmail = ref.watch(authScreenControllerProvider).isValidEmail;
    final isSafetyPass = ref.watch(authScreenControllerProvider).isSafetyPass;
    final isObscure = ref.watch(authScreenControllerProvider).isObscure;
    final userNameController =
        ref.watch(authScreenControllerProvider.notifier).userNameController;
    final emailController =
        ref.watch(authScreenControllerProvider.notifier).emailController;
    final passwordController =
        ref.watch(authScreenControllerProvider.notifier).passwordController;
    final formKey =
        ref.watch(authScreenControllerProvider.notifier).createAccountFormKey;
    final focusNode =
        ref.watch(authScreenControllerProvider.notifier).createAccountFocusNode;
    final errorText = ref.watch(authScreenControllerProvider).errorText;
    final hasError = ref.watch(authScreenControllerProvider).hasError;
    final isNotTap = ref.watch(authScreenControllerProvider).isNotTap;
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
              onPressed: () =>
                  ref.read(authScreenControllerProvider.notifier).reset(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Spacer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///ユーザアイコン
                      UserImage(
                        onTap: () {
                          //画像選択
                          ref
                              .read(authScreenControllerProvider.notifier)
                              .pickImage();
                        },
                        height: context.height * 0.12,
                        isLinkedEmail: true,
                      ),
                      const Gap(20),

                      ///ユーザー名入力
                      UserNameTextField(
                        userNameController: userNameController,
                        isValidUserName: isValidUserName,
                        onChanged: (name) => ref
                            .read(authScreenControllerProvider.notifier)
                            .setUserName(name),
                      ),

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
                      CreateAccountWithEmailButton(
                        text: '新規登録',
                        onPressed: (isValidEmail && isSafetyPass) && !isNotTap
                            ? () {
                                ref
                                    .read(authScreenControllerProvider.notifier)
                                    .switchTap();
                                ref
                                    .read(authScreenControllerProvider.notifier)
                                    .signUp()
                                  ..then(
                                    (value) {
                                      //ログイン失敗
                                      if (value.hasError) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => ErrorDialog(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      authScreenControllerProvider
                                                          .notifier)
                                                  .switchHasError();
                                              Navigator.of(context).pop();
                                            },
                                            content: I18n().loginErrorText(
                                                value.errorText),
                                          ),
                                        );
                                      }
                                      //ログイン成功
                                      else {
                                        // Navigator.of(context).pop();
                                      }
                                      ref
                                          .read(authScreenControllerProvider
                                              .notifier)
                                          .switchTap();
                                    },
                                  );
                              }
                            : null,
                      ),

                      const Gap(20),

                      Text(
                        "登録することで 利用規約 と プライバシーポリシー に同意することになります",
                        style: TextStyle(
                          fontSize: context.height * 0.01,
                        ),
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
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
