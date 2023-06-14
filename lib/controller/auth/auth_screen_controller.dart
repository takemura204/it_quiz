import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import 'auth_screen_state.dart';

final authScreenProvider =
    StateNotifierProvider<AuthScreenController, AuthScreenState>(
  (ref) => AuthScreenController(ref: ref),
);

class AuthScreenController extends StateNotifier<AuthScreenState>
    with LocatorMixin {
  AuthScreenController({required this.ref}) : super(const AuthScreenState()) {
    initState();
  }

  final Ref ref;
  final auth = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  final createAccountFormKey1 = GlobalKey<FormState>();
  final createAccountFormKey2 = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final birthdayController = TextEditingController();
  final loginFocusNode = FocusNode();
  final createFocusNode1 = FocusNode();
  final createFocusNode2 = FocusNode();

  final genders = ["男性", "女性", "未回答"];
  final images = [
    "assets/image/sample_02.jpg",
    "assets/image/sample_01.jpg",
  ];

  @override
  void initState() {
    loadAccountData();
    super.initState();
  }

  /// 端末保存した情報を読み込み、その情報からFirestoreを参照してstateに反映
  Future<void> loadAccountData() async {
    //FirebaseAuthの読み込み
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final uid = user?.uid;

    if (uid != null) {
      final docSnap =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (docSnap.exists) {
        final data = docSnap.data();
        state = state.copyWith(
          uid: data?['uid'],
          email: data?['email'],
          userName: data?['userName'],
          gender: data?['gender'],
          selectGender: data?['gender'],
          birthDay: DateTime.parse(data?['birthDay']),
          selectedBirthDay: DateTime.parse(data?['birthDay']),
        );
        emailController.text = state.email;
        userNameController.text = state.userName;
        birthdayController.text =
            DateFormat('yyyy/MM/dd').format(state.birthDay!);
        genderController.text = state.gender;
      }
    }
  }

  ///アカウントデータを保存
  Future saveAccountData() async {
    final uid = state.uid;
    final email = state.email;
    final password = state.password;
    final userName = state.userName;
    final birthDay = DateFormat('yyyy-MM-dd').format(state.birthDay!);
    final gender = state.gender;
    try {
      //FireStoreに登録
      final users = FirebaseFirestore.instance.collection('users');
      final docRef = users.doc(uid);
      // ドキュメントが存在するかどうかをチェック
      final docSnap = await docRef.get();
      if (docSnap.exists) {
        // 既存のドキュメントを更新
        await docRef.update({
          'userName': userName,
          'birthDay': birthDay,
          'gender': gender,
          'updatedAt': DateTime.now(),
        });
        print("アカウント更新");
      } else {
        // 新規ドキュメントを作成
        await docRef.set({
          'uid': uid,
          'email': email,
          'password': password,
          'userName': userName,
          'birthDay': birthDay,
          'gender': gender,
          'createdAt': DateTime.now(),
          'loginAt': DateTime.now(),
          'updatedAt': DateTime.now(),
        });
        print("アカウント登録");
      }
      // 端末に情報を保存
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', uid);
      prefs.setString('email', email);
      prefs.setString('password', password);
      prefs.setString('userName', userName);
      prefs.setString('birthDay', birthDay);
      prefs.setString('gender', gender);

      state = state.copyWith(
        uid: uid,
        email: email,
        password: password,
        userName: userName,
        birthDay: DateTime.parse(birthDay),
        gender: gender,
      );
    } catch (e) {
      print(e);
      print("登録失敗");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///新規登録
  Future signUp() async {
    try {
      //FirebaseAuthに登録
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User? user = result.user;

      if (user != null) {
        state = state.copyWith(
          uid: user.uid,
          email: emailController.text.trim(),
          userName: userNameController.text.trim(),
        );
      }
    } catch (e) {
      print(e);
      print("登録失敗");
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
      if (user != null && !user.emailVerified) {
        print("メール認証していません");
        return state;
      }
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

  ///ユーザー名入力
  void setUserName(String name) {
    if (name.length < 13) {
      state = state.copyWith(userName: name, isValidUserName: false);
    } else {
      state = state.copyWith(isValidUserName: true);
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
    final regExp = RegExp(r'^[a-zA-Z0-9]{8,}$');
    final isSafetyPass = regExp.hasMatch(password);
    state = state.copyWith(password: password, isSafetyPass: isSafetyPass);
  }

  ///生年月日の入力
  void setBirthday(DateTime date) {
    state = state.copyWith(birthDay: date, selectedBirthDay: date);
  }

  ///性別選択
  void setGender() {
    final selectGender = state.selectGender;
    genderController.text = selectGender;
    state = state.copyWith(gender: selectGender, selectGender: selectGender);
  }

  void setSelectGender(String selectGender) {
    state = state.copyWith(selectGender: selectGender);
  }

  ///画像移動
  void setImageIndex(int index) {
    state = state.copyWith(currentImageIndex: index);
  }

  /// パスワードの表示
  void switchObscure() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  ///エラーの表示
  void switchHasError() {
    state = state.copyWith(hasError: false);
  }

  ///ボタンタップの可否
  void switchTap() {
    final isNotTap = state.isNotTap;
    state = state.copyWith(isNotTap: !isNotTap);
  }

  ///リセット
  void reset() {
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
    createAccountFormKey1.currentState?.reset();
    createAccountFormKey2.currentState?.reset();
    loginFormKey.currentState?.reset();
    loginFocusNode.unfocus();
    createFocusNode1.unfocus();
    createFocusNode2.unfocus();
    state = state.copyWith(
      errorText: "",
      isObscure: true,
      isValidEmail: false,
      isSafetyPass: false,
      hasError: false,
    );
  }
}
