import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

class DialogDefault1 extends ConsumerWidget {
  const DialogDefault1({
    required this.onPressed,
    required this.title,
    required this.subTitle,
    required this.cancelText,
    required this.doneText,
  });

  final VoidCallback onPressed;
  final String title;
  final String subTitle;
  final String cancelText;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.25,
        padding: EdgeInsets.all(context.width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.05,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: context.height * 0.08,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: context.width * 0.04),
                    maxLines: 2,
                  ),
                  const Spacer(),
                ],
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
                      backgroundColor: Colors.white,
                      elevation: 4,
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
                      cancelText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                ),
                Gap(context.width * 0.05),

                ///ログアウトする
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.mainColor,
                      elevation: 4,
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      doneText,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.04,
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

class DialogDefault2 extends ConsumerWidget {
  const DialogDefault2({
    required this.onPressed,
    required this.title,
    required this.subTitle,
    required this.cancelText,
    required this.doneText,
  });

  final VoidCallback onPressed;
  final String title;
  final String subTitle;
  final String cancelText;
  final String doneText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.25,
        padding: EdgeInsets.all(context.width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.05,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: context.height * 0.08,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: context.width * 0.04),
                    maxLines: 2,
                  ),
                  const Spacer(),
                ],
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
                      backgroundColor: Colors.white,
                      elevation: 4,
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
                      cancelText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                ),
                Gap(context.width * 0.05),

                ///実行する
                Container(
                  width: context.width * 0.4,
                  height: context.height * 0.06,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 4,
                      alignment: Alignment.center,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      side: BorderSide(
                        color: context.mainColor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      doneText,
                      style: TextStyle(
                        color: context.mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width * 0.04,
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

class DialogError extends ConsumerWidget {
  const DialogError(
      {required this.onPressed, required this.title, required this.subTitle});
  final VoidCallback? onPressed;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
      child: Container(
        width: context.width * 1,
        height: context.height * 0.25,
        padding: EdgeInsets.all(context.width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: context.height * 0.05,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: context.height * 0.08,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: context.width * 0.04),
                    maxLines: 2,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: context.width * 0.8,
              height: context.height * 0.06,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 4,
                  alignment: Alignment.center,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  side: BorderSide(
                    color: context.mainColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: context.mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.04,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
