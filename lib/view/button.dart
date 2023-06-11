import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

class Default1Button extends ConsumerWidget {
  const Default1Button({required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.06,
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
            color: onPressed == null ? Colors.white10 : context.mainColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null ? Colors.black45 : context.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class Default2Button extends ConsumerWidget {
  const Default2Button({required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.mainColor,
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
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///Backボタン
class CustomBackButton extends ConsumerWidget {
  const CustomBackButton({required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.center,
      child: IconButton(
        padding: EdgeInsets.all(context.width * 0.01),
        iconSize: context.width * 0.06,
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: context.mainColor,
        ),
      ),
    );
  }
}

///Clearボタン
class ClearButton extends ConsumerWidget {
  const ClearButton({required this.iconSize, required this.onPressed});
  final double iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      child: IconButton(
        padding: EdgeInsets.all(context.width * 0.01),
        alignment: Alignment.topRight,
        iconSize: iconSize,
        onPressed: () {
          onPressed();
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.clear,
          color: context.mainColor,
        ),
      ),
    );
  }
}

///パスワード表示ボタン
class ObscureIconButton extends ConsumerWidget {
  const ObscureIconButton({required this.onPressed, required this.isObscure});
  final VoidCallback? onPressed;
  final bool isObscure;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onPressed,
      // 表示アイコン
      icon: isObscure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility_outlined),
      color: isObscure ? Colors.grey : context.mainColor,
    );
  }
}

///チェエクボックスボタン
class CheckBoxIconButton extends ConsumerWidget {
  const CheckBoxIconButton({required this.onPressed, required this.isCheck});
  final VoidCallback? onPressed;
  final bool isCheck;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.08,
      height: context.height * 0.05,
      child: IconButton(
        padding: const EdgeInsets.all(0.0),
        onPressed: onPressed,
        // 表示アイコン
        icon: isCheck
            ? const Icon(Icons.check_box_outlined)
            : const Icon(Icons.check_box_outline_blank_outlined),
        color: isCheck ? context.mainColor : Colors.grey,
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

///プロフィール編集ボタン
class EditProfileButton extends ConsumerWidget {
  const EditProfileButton({required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      width: context.width * 1,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: context.mainColor,
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: context.mainColor,
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

///Googleから登録ボタン
class SignInWithGoogleButton extends ConsumerWidget {
  const SignInWithGoogleButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.8,
      height: context.height * 0.06,
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
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
              ),
            ),
            Container(
              width: context.width * 0.65,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: context.height * 0.02,
                ),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///Googleアイコン
class GoogleIconButton extends ConsumerWidget {
  const GoogleIconButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.15,
      height: context.width * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        child: Container(
          width: context.width * 0.1,
          height: context.width * 0.1,
          child: Image.asset(
            'assets/icon/Google_icon.png',
            fit: BoxFit.contain,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///Twitterアイコン
class TwitterIconButton extends ConsumerWidget {
  const TwitterIconButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.15,
      height: context.width * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        child: Container(
          width: context.width * 0.15,
          height: context.width * 0.15,
          child: Image.asset(
            'assets/icon/Twitter_icon.png',
            fit: BoxFit.contain,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///Lineアイコン
class LineIconButton extends ConsumerWidget {
  const LineIconButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.15,
      height: context.width * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
        child: Container(
          width: context.width * 0.15,
          height: context.width * 0.15,
          child: Image.asset(
            'assets/icon/Line_icon.png',
            fit: BoxFit.contain,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

///ログアウトボタン
class SignOutButton extends ConsumerWidget {
  const SignOutButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // color: Colors.amber,
      height: context.height * 0.05,
      width: context.width * 1,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: context.mainColor,
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          "ログアウト",
          style: TextStyle(
            color: context.mainColor,
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
