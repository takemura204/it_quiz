import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/view/button.dart';

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
