import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_notifier/state_notifier.dart';

import 'auth_screen_state.dart';

final authScreenControllerProvider =
    StateNotifierProvider<AuthScreenController, AuthScreenState>(
  (ref) => AuthScreenController(ref: ref),
);

class AuthScreenController extends StateNotifier<AuthScreenState>
    with LocatorMixin {
  AuthScreenController({required this.ref}) : super(const AuthScreenState());

  final Ref ref;
  final auth = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  final createAccountFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFocusNode = FocusNode();
  final createAccountFocusNode = FocusNode();
  final images = [
    "assets/image/sample_02.jpg",
    "assets/image/sample_01.jpg",
    "assets/image/sample_02.jpg",
    "assets/image/sample_01.jpg",
  ];

  @override
  void initState() {
    print("authScreenControllerProvider");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  ///ユーザー名入力
  void setUserName(String name) {
    if (name.length > 16) {
      state = state.copyWith(userName: name, isValidUserName: false);
    } else {
      state = state.copyWith(userName: name, isValidUserName: true);
    }
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

  ///新規登録
  Future<AuthScreenState> signUp() async {
    try {
      ///FirebaseAuthに登録
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User? user = result.user;
      await user?.updateDisplayName(userNameController.text.trim());

      ///FireStoreに登録
      final users = FirebaseFirestore.instance.collection('users');
      users.add({
        'name': userNameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      });

      state = state.copyWith(
          email: emailController.text.trim(),
          userName: userNameController.text.trim());
    } catch (e) {
      print(e);
      print("登録失敗");
      final hasError = state.hasError;
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///ログイン
  Future<AuthScreenState> signIn() async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User? user = result.user;
      await user?.updateDisplayName(userNameController.text.trim());
      state = state.copyWith(email: emailController.text.trim());
      print("ログイン成功");
    } catch (e) {
      print(e);
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///ログアウト
  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      print("ログアウト成功");
    } catch (e) {
      print(e);
    }
  }

  ///Googleから登録
  Future signInWithGoogle() async {
    try {
      // 認証フローのトリガー
      final googleUser = await GoogleSignIn(scopes: [
        'email',
      ]).signIn();
      // リクエストから、認証情報を取得
      final googleAuth = await googleUser?.authentication;
      // クレデンシャルを新しく作成
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // サインインしたら、UserCredentialを返す
      return FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException');
      print('${e.code}');
    } on Exception catch (e) {
      print('Other Exception');
      print('${e.toString()}');
    }
  }

  /// 画像をギャラリーから選ぶ
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // 画像がnullの場合戻る
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      state = state.copyWith(userImage: imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  /// 画像をカメラで撮る
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // 画像がnullの場合戻る
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      state = state.copyWith(userImage: imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void switchHasError() {
    final hasError = state.hasError;
    state = state.copyWith(hasError: false);
  }

  void switchTap() {
    final isNotTap = state.isNotTap;
    state = state.copyWith(isNotTap: !isNotTap);
  }

  ///リセット
  void reset() {
    // emailController.clear();
    // passwordController.clear();
    // state = state.copyWith(
    //   email: "",
    //   password: "",
    //   errorText: "",
    //   isObscure: true,
    //   isValidEmail: false,
    //   isSafetyPass: false,
    //   hasError: false,
    // );
  }
}
