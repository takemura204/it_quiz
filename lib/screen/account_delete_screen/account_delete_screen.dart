import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../../view/icon_button.dart';
import '../../view/text_field.dart';

class AccountDeleteScreen extends ConsumerWidget {
  const AccountDeleteScreen(this.arguments);
  final AccountDeleteScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSafetyPass = ref.watch(authProvider).isSafetyPass;
    final isObscure = ref.watch(authProvider).isObscure;
    final passwordController =
        ref.watch(authProvider.notifier).passwordController;
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
            title: const Text("アカウント削除"),
            leading: CustomBackButton(onPressed: () {
              Navigator.pop(context);
            }),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Column(
              children: [
                Gap(context.height * 0.1),
                Text(
                  "アカウントを削除する場合は、下記に設定したパスワードを入力してください。",
                  style: TextStyle(
                      color: Colors.black87, fontSize: context.width * 0.035),
                ),
                Gap(context.height * 0.02),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ///パスワード
                      PasswordTextField(
                        passwordController: passwordController,
                        isValid: passwordController.text.isNotEmpty,
                        isSafetyPass: isSafetyPass,
                        isObscure: isObscure,
                        isLogin: true,
                        onChanged: (password) => ref
                            .read(authProvider.notifier)
                            .setPassword(password),
                        obscureIconButtonPressed: () =>
                            ref.read(authProvider.notifier).switchObscure(),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "【ご注意事項】",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: context.width * 0.03),
                    ),
                    Text(
                      "アカウントを削除すると、アカウントに紐づく全てのデータは削除され、元に戻すことができなくなります。\nまた、アカウント削除後に再度利用する場合、新しいアカウントを作成する必要があります。",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: context.width * 0.03),
                    ),
                  ],
                ),

                Gap(context.height * 0.03),

                ///削除ボタン
                DangerButton(
                  width: context.width * 0.8,
                  height: context.height * 0.07,
                  text: 'アカウントを完全に削除',
                  onPressed: passwordController.text.isNotEmpty && !isNotTap
                      ? () {
                          ref.read(authProvider.notifier).switchTap();
                          ref.read(authProvider.notifier).deleteAccount()
                            ..then((value) {
                              //ログイン失敗
                              if (value.hasError) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => SecondaryCloseDialog(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    title: "エラー",
                                    subWidget: Text(
                                      "入力したパスワードは正しくありません。\nご確認の上、もう一度お試しください。",
                                      textAlign: TextAlign.center,
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
                                  builder: (_) => DefaultCloseDialog(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    iconWidget: Icon(
                                      Icons.check_circle_outline_sharp,
                                      size: context.height * 0.1,
                                      color: context.mainColor,
                                    ),
                                    title: "アカウントを削除いたしました。",
                                    subWidget: Column(
                                      children: [
                                        Text(
                                          "今までご利用頂き誠にありがとうございました。",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: context.width * 0.035,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
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
