import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../screen/screen_argument.dart';
import 'button_icon/password_button.dart';

///メールアドレス入力
class EmailTextField extends ConsumerWidget {
  const EmailTextField(
      {required this.emailController,
      required this.isValidEmail,
      required this.onChanged});

  final TextEditingController emailController;
  final bool isValidEmail;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.11,
      child: Column(
        children: [
          Container(
            height: context.height * 0.023,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            child: Text(
              "メールアドレス",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            autocorrect: true,
            //予測変換
            autofocus: true,
            //TextFieldに自動でfocusを当てる
            enabled: true,
            obscureText: false,
            textInputAction: TextInputAction.next,
            //次のTextFieldへ自動でfocusを移す
            maxLines: 1,
            // validator: (value) => isValidEmail ? null : '無効なメールアドレスです',
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // 追加した部分
              hintMaxLines: null,
              hintText: 'Email',
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
              ),
              // errorStyle: TextStyle(
              //   fontSize: context.width * 0.03, // エラーメッセージのフォントサイズ
              // ),
              prefixIcon: const Icon(Icons.mail_outline),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///パスワード入力
class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({
    required this.passwordController,
    required this.isValid,
    required this.isSafetyPass,
    required this.isObscure,
    required this.onChanged,
    required this.isLogin,
    required this.obscureIconButtonPressed,
  });

  final TextEditingController passwordController;
  final bool isValid;
  final bool isSafetyPass;
  final bool isObscure;
  final bool isLogin;
  final ValueChanged<String>? onChanged;
  final VoidCallback? obscureIconButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.135,
      child: Column(
        children: [
          Container(
            height: context.height * 0.023,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            child: Text(
              "パスワード",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: passwordController,
            enabled: true,
            keyboardType: TextInputType.visiblePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // validator: (value) => isSafetyPass ? null : '無効なパスワードです',
            onChanged: onChanged,
            minLines: null,
            maxLines: 1,
            obscureText: isObscure,
            //入力非表示
            decoration: InputDecoration(
              hintMaxLines: null,
              hintText: 'Password',
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.height * 0.0,
              ),
              // errorStyle: TextStyle(
              //   fontSize: context.width * 0.03, // エラーメッセージのフォントサイズ
              // ),
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: PasswordIconButton(
                onPressed: obscureIconButtonPressed,
                isObscure: isObscure,
              ),
            ),
          ),
          Gap(context.height * 0.005),
          Container(
            height: context.height * 0.02,
            alignment: isLogin ? Alignment.bottomRight : Alignment.bottomLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.0),
            child: isLogin
                ? RichText(
                    text: TextSpan(children: [
                    TextSpan(
                      text: 'パスワードを忘れた場合',
                      style: TextStyle(
                        fontSize: context.width * 0.03,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.normal,
                        color: Colors.black45,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.showScreen(
                            const AccountUpdateScreenArguments()
                                .generateRoute()),
                    ),
                  ]))
                : Text(
                    "*8桁以上の半角英数字・記号のみ",
                    style: TextStyle(fontSize: context.width * 0.03),
                  ),
          ),
        ],
      ),
    );
  }
}

///ニックネーム入力
class UserNameTextField extends ConsumerWidget {
  const UserNameTextField(
      {required this.userNameController,
      required this.isValidUserName,
      required this.onChanged});

  final TextEditingController userNameController;
  final bool isValidUserName;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 90,
      child: Column(
        children: [
          Container(
            height: context.height * 0.023,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            child: Text(
              "ニックネーム",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: userNameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            onChanged: onChanged,
            autocorrect: true,
            //予測変換
            autofocus: true,
            //TextFieldに自動でfocusを当てる
            enabled: true,
            obscureText: false,
            textInputAction: TextInputAction.done,
            //次のTextFieldへ自動でfocusを移す
            maxLines: 1,
            // validator: (value) => isValidUserName ? null : 'ユーザー名は15文字以内にしてください',
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // 追加した部分
              hintMaxLines: null,
              hintText: 'Name',
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
              ),
              // errorStyle: TextStyle(
              //   fontSize: context.width * 0.03, // エラーメッセージのフォントサイズ
              // ),
              prefixIcon: const Icon(Icons.person_outline_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

///生年月日
class BirthDayTextField extends ConsumerWidget {
  const BirthDayTextField(
      {required this.birthdayController, required this.onTap});

  final TextEditingController birthdayController;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.11,
      child: Column(
        children: [
          Container(
            height: context.height * 0.023,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            child: Text(
              "生年月日",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: birthdayController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            autocorrect: true,
            //予測変換
            autofocus: true,
            //TextFieldに自動でfocusを当てる
            enabled: true,
            obscureText: false,
            textInputAction: TextInputAction.next,
            //次のTextFieldへ自動でfocusを移す
            maxLines: 1,
            onTap: onTap,
            readOnly: true,
            // validator: (value) => isValidUserName ? null : 'ユーザー名は15文字以内にしてください',
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // 追加した部分
              hintMaxLines: null,
              hintText:
                  '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
              ),
              // errorStyle: TextStyle(
              //   fontSize: context.width * 0.03, // エラーメッセージのフォントサイズ
              // ),
              prefixIcon: const Icon(Icons.celebration_outlined),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///性別
class GenderTextField extends ConsumerWidget {
  const GenderTextField({required this.genderController, required this.onTap});

  final TextEditingController genderController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.11,
      child: Column(
        children: [
          Container(
            height: context.height * 0.023,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            child: Text(
              "性別",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: context.width * 0.035,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: genderController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            autocorrect: true,
            //予測変換
            autofocus: false,
            //TextFieldに自動でfocusを当てる
            enabled: true,
            obscureText: false,
            textInputAction: TextInputAction.next,
            //次のTextFieldへ自動でfocusを移す
            maxLines: 1,
            onTap: onTap,
            readOnly: true,
            // validator: (value) => isValidUserName ? null : 'ユーザー名は15文字以内にしてください',
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                // 追加した部分
                hintMaxLines: null,
                hintText: 'Gender',
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                ),
                // errorStyle: TextStyle(
                //   fontSize: context.width * 0.03, // エラーメッセージのフォントサイズ
                // ),
                prefixIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: context.width * 0.02),
                      child: const Icon(Icons.man_outlined),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: context.width * 0.02),
                      child: const Icon(Icons.woman_outlined),
                    ),
                  ],
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///直接編集可能
class EditTextField extends ConsumerWidget {
  const EditTextField({
    required this.textController,
    required this.isValid,
    required this.onChanged,
    required this.hintText,
    required this.labelText,
    required this.errorText,
    required this.prefixIcon,
    required this.isTap,
    required this.isObscure,
    required this.onTap,
  });

  final TextEditingController textController;
  final bool isValid;
  final ValueChanged<String>? onChanged;
  final String labelText;
  final String hintText;
  final String errorText;
  final Icon prefixIcon;
  final bool isTap;
  final bool isObscure;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.1,
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        maxLines: 1,
        obscureText: isObscure,
        //入力非表示
        decoration: InputDecoration(
          labelText: labelText,
          hintMaxLines: null,
          hintText: hintText,
          fillColor: const Color(0xffF8FAFA),
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26, //通常時
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.mainColor,
              width: 1, //入力中
            ),
          ),
        ),
        validator: (x) => isValid ? null : errorText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: isTap,
        //編集可能か
        onTap: onTap,
      ),
    );
  }
}

class SearchTextField extends ConsumerWidget {
  const SearchTextField({
    required this.searchController,
    required this.onChanged,
    required this.onFieldSubmitted,
    required this.onClear,
    required this.isTextEmpty,
  });

  final TextEditingController searchController;
  final bool isTextEmpty;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;

  final VoidCallback onClear;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 70,
      child: Column(
        children: [
          const Spacer(),
          TextFormField(
            controller: searchController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            autocorrect: true,
            //予測変換
            autofocus: false,
            //TextFieldに自動でfocusを当てる
            enabled: true,
            obscureText: false,
            textInputAction: TextInputAction.done,
            //次のTextFieldへ自動でfocusを移す
            maxLines: 1,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // 追加した部分
              hintMaxLines: null,
              hintText: '検索',
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
              ),
              prefixIcon: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(math.pi),
                child: const Icon(LineIcons.search),
              ),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: onClear,
                      icon: const Icon(
                        LineIcons.timesCircleAlt,
                        color: Colors.black45,
                      ),
                    )
                  : null,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
