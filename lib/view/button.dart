import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

class PrimaryButton extends ConsumerWidget {
  const PrimaryButton(
      {required this.width,
      required this.height,
      required this.text,
      required this.onPressed});
  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.mainColor,
          elevation: 2,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: height < context.height * 0.05
                ? context.height * 0.015
                : context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class DefaultButton extends ConsumerWidget {
  const DefaultButton(
      {required this.width,
      required this.height,
      required this.text,
      required this.onPressed});
  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: BorderSide(
            color: onPressed == null ? Colors.white10 : context.mainColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null ? Colors.black45 : context.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: height < context.height * 0.05
                ? context.height * 0.015
                : context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class SecondaryButton extends ConsumerWidget {
  const SecondaryButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: const BorderSide(
            color: Colors.black45,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class DisabledButton extends ConsumerWidget {
  const DisabledButton({
    required this.width,
    required this.height,
    required this.text,
  });
  final double width;
  final double height;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: const BorderSide(
            color: Colors.white10,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontSize: height < context.height * 0.05
                ? context.height * 0.015
                : context.height * 0.02,
          ),
        ),
        onPressed: null,
      ),
    );
  }
}

class DangerButton extends ConsumerWidget {
  const DangerButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onPressed,
  });
  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
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
          side: BorderSide(
            color: onPressed == null ? Colors.white10 : Colors.red,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null ? Colors.black45 : Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///ログイン・ログアウトボタン
class SetAccountButton extends ConsumerWidget {
  const SetAccountButton({required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.06,
      width: context.width * 1,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.2, vertical: context.width * 0.01),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
