import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/view/button.dart';

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
      height: context.height * 0.1,
      child: TextFormField(
        controller: emailController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => isValidEmail ? null : '無効なメールアドレスです',
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        autocorrect: true, //予測変換
        autofocus: true, //TextFieldに自動でfocusを当てる
        enabled: true,
        obscureText: false,
        textInputAction: TextInputAction.next, //次のTextFieldへ自動でfocusを移す
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF8FAFA),
          hintMaxLines: null,
          hintText: 'Email',
          labelText: "メールアドレス",
          prefixIcon: const Icon(Icons.mail_outline),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
        ),
      ),
    );
  }
}

///パスワード入力
class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({
    required this.passwordController,
    required this.isValidEmail,
    required this.isSafetyPass,
    required this.isObscure,
    required this.onChanged,
    required this.obscureIconButtonPressed,
  });
  final TextEditingController passwordController;
  final bool isValidEmail;
  final bool isSafetyPass;
  final bool isObscure;
  final ValueChanged<String>? onChanged;
  final VoidCallback? obscureIconButtonPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // color: Colors.blue,
      height: context.height * 0.1,
      child: TextFormField(
        controller: passwordController,
        enabled: true,
        keyboardType: TextInputType.visiblePassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => isSafetyPass ? null : '無効なパスワードです',
        onChanged: onChanged,
        minLines: null,
        maxLines: 1,
        obscureText: isObscure, //入力非表示
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF8FAFA),
          hintMaxLines: null,
          hintText: 'Password',
          labelText: "パスワード(6文字以上)",
          prefixIcon: const Icon(Icons.lock_outlined),
          suffixIcon: ObscureIconButton(
            onPressed: obscureIconButtonPressed,
            isObscure: isObscure,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
        ),
      ),
    );
  }
}

///ユーザー名入力
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
      height: context.height * 0.1,
      child: TextFormField(
        controller: userNameController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => isValidUserName ? null : 'ユーザー名は15文字以内にしてください',
        keyboardType: TextInputType.name,
        onChanged: onChanged,
        autocorrect: true, //予測変換
        autofocus: true, //TextFieldに自動でfocusを当てる
        enabled: true,
        obscureText: false,
        textInputAction: TextInputAction.next, //次のTextFieldへ自動でfocusを移す
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF8FAFA),
          hintMaxLines: null,
          hintText: 'Name',
          labelText: "ユーザー名",
          prefixIcon: const Icon(Icons.person_outline_outlined),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black26,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: context.colors.main50,
            ),
          ),
        ),
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
        obscureText: isObscure, //入力非表示
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
              color: context.colors.main50,
              width: 1, //入力中
            ),
          ),
        ),
        validator: (x) => isValid ? null : errorText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        readOnly: isTap, //編集可能か
        onTap: onTap,
      ),
    );
  }
}
