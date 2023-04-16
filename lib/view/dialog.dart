import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../controller/auth/auth_screen_controller.dart';

class ErrorDialog extends ConsumerWidget {
  const ErrorDialog({required this.onPressed, required this.content});
  final VoidCallback? onPressed;
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.03),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.03,
              child: Text(
                "エラー",
                style: TextStyle(
                  fontSize: context.height * 0.023,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: context.height * 0.06,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: context.height * 0.018),
              ),
            ),
            const Spacer(),
            Container(
              width: context.width * 0.8,
              height: context.height * 0.06,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.background,
                  elevation: 4,
                  padding: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  side: const BorderSide(
                      color: Colors.black54,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                child: Text(
                  "OK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: context.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: context.width * 0.05)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class NeedSignUpDialog extends ConsumerWidget {
  const NeedSignUpDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.04,
              child: Text(
                "アカウントを作成しましょう",
                style: TextStyle(
                  fontSize: context.height * 0.023,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Gap(10),
            Container(
              height: context.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "名前やプロフィール画像を設定するには\nアカウントの登録が必要です",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: context.height * 0.02),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      return Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.background,
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: const BorderSide(
                          color: Colors.black54,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Text(
                      "キャンセル",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: context.height * 0.02,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: context.width * 0.05)),

                ///登録する
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      context.showScreen(
                        const CreateAccountScreenArguments().generateRoute(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.background,
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: BorderSide(
                        color: context.colors.main50.withOpacity(0.7),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "新規登録",
                      style: TextStyle(
                        color: context.colors.main50.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: context.height * 0.02,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

///サインアウトする
class SignOutDialog extends ConsumerWidget {
  const SignOutDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.04,
              child: Text(
                "ログアウトしますか？",
                style: TextStyle(
                  fontSize: context.height * 0.023,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///キャンセル
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      return Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.background,
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: const BorderSide(
                          color: Colors.black54,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Text(
                      "キャンセル",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: context.height * 0.02,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: context.width * 0.05)),

                ///ログアウトする
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(authScreenControllerProvider.notifier).signOut();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.main50.withOpacity(0.7),
                      elevation: 4,
                      padding: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "ログアウト",
                      style: TextStyle(
                        color: context.colors.onMain50,
                        fontWeight: FontWeight.bold,
                        fontSize: context.height * 0.02,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
