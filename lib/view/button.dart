import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

///Clearボタン
class ClearButton extends ConsumerWidget {
  const ClearButton({required this.iconSize, required this.onPressed});
  final double iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.bottomRight,
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        iconSize: iconSize,
        onPressed: () {
          Navigator.pop(context);
          onPressed();
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    );
  }
}

///Backボタン
class CustomBackButton extends ConsumerWidget {
  const CustomBackButton({required this.iconSize, required this.onPressed});
  final double iconSize;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      alignment: Alignment.bottomRight,
      child: IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        iconSize: iconSize,
        onPressed: () {
          Navigator.pop(context);
          onPressed();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
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
      color: isObscure ? Colors.grey : context.colors.main50,
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
        color: isCheck ? context.colors.main50 : Colors.grey,
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
      height: context.height * 0.05,
      width: context.width * 1,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: context.colors.main50.withOpacity(0.7),
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.6),
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
          backgroundColor: context.colors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: context.colors.main50.withOpacity(0.7),
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.6),
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

///メールアドレスでログイン
class LoginWithEmailButton extends ConsumerWidget {
  const LoginWithEmailButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.7,
      height: context.height * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.main50,
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

///メールアドレスで登録
class CreateAccountWithEmailButton extends ConsumerWidget {
  const CreateAccountWithEmailButton(
      {required this.text, required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.7,
      height: context.height * 0.06,
      child: ElevatedButton(
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
            color: onPressed == null
                ? Colors.black45
                : context.colors.main50.withOpacity(0.7),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onPressed == null
                ? Colors.black45
                : context.colors.main50.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: context.height * 0.02,
          ),
        ),
        onPressed: onPressed,
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
          backgroundColor: context.colors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          side: BorderSide(
            color: context.colors.main50.withOpacity(0.7),
            width: 2,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          "ログアウト",
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.6),
            fontSize: context.height * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
