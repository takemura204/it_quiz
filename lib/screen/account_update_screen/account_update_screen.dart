import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/dialog.dart';
import '../../view/text_field.dart';

class AccountUpdateScreen extends ConsumerWidget {
  const AccountUpdateScreen(this.arguments);

  final AccountUpdateScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(authProvider.notifier).emailController;
    final formKey = ref.watch(authProvider.notifier).updateFormKey;
    final focusNode = ref.watch(authProvider.notifier).updateFocusNode;
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
            title: const Text("パスワード再設定"),
            leading: CustomBackButton(onPressed: () {
              Navigator.pop(context);
            }),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Column(
              children: [
                Gap(context.height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///メールアドレス
                      EmailTextField(
                        emailController: emailController,
                        isValidEmail: emailController.text.isNotEmpty,
                        onChanged: (email) =>
                            ref.read(authProvider.notifier).setEmail(email),
                      ),
                    ],
                  ),
                ),

                Gap(context.height * 0.03),

                ///送信ボタン
                DefaultButton(
                  width: context.width * 0.8,
                  height: context.height * 0.07,
                  text: '再設定する',
                  onPressed: emailController.text.isNotEmpty && !isNotTap
                      ? () {
                          ref.read(authProvider.notifier).switchTap();
                          ref
                              .read(authProvider.notifier)
                              .sendPasswordResetEmail()
                            ..then((value) {
                              //ログイン失敗
                              if (value.hasError) {
                                showDialog(
                                  context: context,
                                  builder: (_) => SecondaryCloseDialog(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    title: "エラー",
                                    subWidget: Text(
                                      I18n().loginErrorText(value.errorText),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: context.width * 0.035,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    doneText: "OK",
                                  ),
                                );
                              }
                              //ログイン成功
                              else {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => DefaultCloseDialog(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    iconWidget: Icon(
                                      Icons.mail_outline,
                                      size: context.height * 0.1,
                                      color: context.mainColor,
                                    ),
                                    title: "メールを送信しました。",
                                    subWidget: Text(
                                      "届いたメールからパスワードを再設定して、\n新しいパスワードでログインしてください。",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: context.width * 0.035,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    doneText: "OK",
                                  ),
                                );
                              }
                              ref.read(authProvider.notifier).switchTap();
                            });
                        }
                      : null,
                ),

                const Spacer(),
                Gap(context.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
