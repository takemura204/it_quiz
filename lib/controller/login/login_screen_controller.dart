import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'login_screen_state.dart';

final loginScreenControllerProvider =
    StateNotifierProvider<LoginScreenController, LoginScreenState>(
  (ref) => LoginScreenController(ref: ref),
);

class LoginScreenController extends StateNotifier<LoginScreenState>
    with LocatorMixin {
  LoginScreenController({required this.ref}) : super(const LoginScreenState());

  final Ref ref;
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    print("ログイン");
    super.initState();
  }

  ///リセット
  void reset() {
    emailController.clear();
    passwordController.clear();
    state = state.copyWith(
      email: "",
      password: "",
      errorText: "",
      isObscure: true,
      isValidEmail: false,
      isSafetyPass: false,
      hasError: false,
    );
  }

  ///メールアドレスの入力
  void setEmail(String email) {
    final regExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&‘*+-/=?^_`{|}~]+@[a-zA-Z0-9.!#$%&‘*+-/=?^_`{|}~]+\.[a-zA-Z0-9-]+$');
    final isValidEmail = regExp.hasMatch(email);
    state = state.copyWith(email: email, isValidEmail: isValidEmail);
  }

  ///パスワードの入力
  void setPassword(String password) {
    final regExp = RegExp(r'^[a-zA-Z0-9]{6,}$');
    final isSafetyPass = regExp.hasMatch(password);
    state = state.copyWith(password: password, isSafetyPass: isSafetyPass);
  }

  /// パスワードの表示
  void switchObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  ///ログイン
  Future signIn() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      state = state.copyWith(hasError: false);
      print("会員登録成功");
    } catch (e) {
      print(e);
      state = state.copyWith(hasError: true, errorText: e.toString());
    }
  }
}
