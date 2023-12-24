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

import 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref: ref),
);

class AuthController extends StateNotifier<AuthState> with LocatorMixin {
  AuthController({required this.ref}) : super(const AuthState()) {
    initState();
  }

  final Ref ref;
  final auth = FirebaseAuth.instance;
  final loginFormKey = GlobalKey<FormState>();
  final updateFormKey = GlobalKey<FormState>();
  final createAccountFormKey1 = GlobalKey<FormState>();
  final createAccountFormKey2 = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final birthdayController = TextEditingController();
  final updateFocusNode = FocusNode();
  final loginFocusNode = FocusNode();
  final createFocusNode1 = FocusNode();
  final createFocusNode2 = FocusNode();
  final genders = ["男性", "女性", "未回答"];
  final images = ["assets/image/sample_02.jpg", "assets/image/sample_01.jpg"];

  @override
  void initState() {
    loadAccountData();
    super.initState();
  }

  /// 端末保存した情報を読み込み、その情報からFirestoreを参照してstateに反映
  Future loadAccountData() async {
    try {
      //FirebaseAuthの読み込み
      final user = auth.currentUser;
      final uid = user?.uid;
      if (uid != null) {
        final docSnap =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (docSnap.exists) {
          final data = docSnap.data();
          state = state.copyWith(
            uid: data?['uid'] ?? state.uid,
            email: data?['email'] ?? state.email,
            password: '',
            userName: data?['userName'] ?? state.userName,
            gender: data?['gender'] ?? state.gender,
            selectGender: data?['gender'] ?? state.selectGender,
            birthDay: data?['birthDay'] != null
                ? DateFormat('yyyy-MM-dd')
                    .format((data?['birthDay'] as Timestamp).toDate())
                : state.birthDay,
          );
        }
      } else {
        print("Null User");
      }
      emailController.text = state.email;
      passwordController.text = state.password;
      userNameController.text = state.userName;
      birthdayController.text = state.birthDay.contains('-')
          ? state.birthDay.replaceAll('-', '/')
          : state.birthDay;
      genderController.text = state.gender;
      print("loadAccountData");
    } catch (e, s) {
      print({e, s});
      print("Error：loadAccountData");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///新規登録
  Future signUp() async {
    setAuthActiveType(AuthActiveType.signUp);
    try {
      //FirebaseAuthに登録
      final result = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User? user = result.user;
      if (user != null) {
        //stateを更新
        state = state.copyWith(
          uid: user.uid,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          userName: userNameController.text.trim(),
          isLogin: true,
        );
        await _saveFirestore(); //Firestoreに保存
        _saveDevice(); //デバイスに保存
        loadAccountData(); //データ更新
        await user.sendEmailVerification(); // 登録完了メールを送信
        print("新規登録成功");
      }
    } catch (e, s) {
      print({e, s});
      print("Error：signUp");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///ログイン
  Future<AuthState> signIn() async {
    setAuthActiveType(AuthActiveType.signIn);
    try {
      //FirebaseAuthでログイン
      final result = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final User? user = result.user;
      if (user != null) {
        //state更新
        state = state.copyWith(
          uid: user.uid,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          isLogin: true,
        );
        await _saveFirestore(); //Firestoreに保存
        _saveDevice(); //デバイスに保存
        loadAccountData(); //データ更新
        print("ログイン成功");
      }
    } catch (e, s) {
      print({e, s});
      print("Error：signIn");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }

    return state;
  }

  /// パスワードを忘れた場合のリセットメールを送信
  Future sendPasswordResetEmail() async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      print("Password reset email sent.");
    } catch (e, s) {
      print({e, s});
      print("Error：sendPasswordResetEmail");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///プロフィール更新
  Future changingProfile() async {
    setAuthActiveType(AuthActiveType.changing);
    try {
      final user = auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(state.userName); //Authenticationに保存
      }
      await _saveFirestore(); //Firestoreに保存
      _saveDevice(); //デバイスに保存
      loadAccountData(); //データ更新
      print("プロフィール更新");
    } catch (e, s) {
      print({"Error：changingProfile", e, s});
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///ログアウト
  Future signOut() async {
    setAuthActiveType(AuthActiveType.signOut);
    try {
      final user = auth.currentUser;
      if (user != null) {
        reset();
        await _saveFirestore(); //Firestoreに保存
        await auth.signOut(); //ログアウト
        _saveDevice(); //デバイスに保存
        loadAccountData(); //データ更新
        print("ログアウト成功");
      }
    } catch (e, s) {
      print({"Error：signOut", e, s});
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///アカウント削除
  Future deleteAccount() async {
    setAuthActiveType(AuthActiveType.delete);
    try {
      final user = auth.currentUser;
      if (user != null) {
        final credential = EmailAuthProvider.credential(
            email: state.email, password: state.password);
        await user.reauthenticateWithCredential(credential);
        await auth.currentUser?.delete(); //アカウント削除
        reset();
        await _saveFirestore(); //Firestoreに保存
        await auth.signOut(); //ログアウト
        _saveDevice(); //デバイスに保存
        loadAccountData(); //データ更新
        print("アカウント削除成功");
      }
    } catch (e, s) {
      print({"Error：deleteAccount", e, s});
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  ///ログイン状態更新
  void setAuthActiveType(AuthActiveType activeType) {
    state = state.copyWith(activeType: activeType);
    print(activeType);
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

  ///ユーザー名入力
  void setUserName(String name) {
    if (name.length < 13) {
      state = state.copyWith(userName: name, isValidUserName: false);
    } else {
      state = state.copyWith(isValidUserName: true);
    }
  }

  ///生年月日の入力
  void setBirthday(DateTime date) {
    final birthDayStr = DateFormat('yyyy-MM-dd').format(date);
    state = state.copyWith(birthDay: birthDayStr);
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
      return auth.signInWithCredential(credential);
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

  ///Firestoreに保存
  Future _saveFirestore() async {
    try {
      final activeType = state.activeType;
      final user = auth.currentUser;
      final uid = user?.uid;
      final users = FirebaseFirestore.instance.collection('users');
      final docRef = users.doc(uid);
      final docSnap = await docRef.get();
      switch (activeType) {
        //新規登録
        case AuthActiveType.signUp:
          if (!docSnap.exists) {
            await docRef.set({
              'uid': state.uid,
              'email': state.email,
              'password': state.password,
              'createdAt': DateTime.now(),
              'loginAt': DateTime.now(),
              'updatedAt': DateTime.now(),
              'isLogin': true,
            });
            print("Firestore Save ");
          }
          return state;
        //ログイン
        case AuthActiveType.signIn:
          if (docSnap.exists) {
            await docRef.set({
              'email': state.email,
              'password': state.password,
              'loginAt': DateTime.now(),
              'updatedAt': DateTime.now(),
              'isLogin': true,
            }, SetOptions(merge: true));
            print("Firestore Save SignIn");
          }
          return state;
        //プロフィール更新
        case AuthActiveType.changing:
          if (docSnap.exists) {
            // 既存のドキュメントを更新
            await docRef.set({
              'userName': state.userName,
              'birthDay': DateTime.parse(state.birthDay),
              'gender': state.gender,
              'updatedAt': DateTime.now(),
            }, SetOptions(merge: true));
            print("Firestore Save ProfileChanging");
          }
          return state;
        //アカウント更新
        case AuthActiveType.update:
          if (docSnap.exists) {
            // 既存のドキュメントを更新
            await docRef.set({
              'email': state.email,
              'password': state.password,
              'updatedAt': DateTime.now(),
            }, SetOptions(merge: true));
            print("Firestore Save AccountUpdate");
          }
          return state;
        //ログアウト
        case AuthActiveType.signOut:
          if (docSnap.exists) {
            // 既存のドキュメントを更新
            await docRef.set({
              'updatedAt': DateTime.now(),
              'logoutAt': DateTime.now(),
              'isLogin': false,
            }, SetOptions(merge: true));
            print("Firestore Save SignOut");
          }
          return state;
        //アカウント削除
        case AuthActiveType.delete:
          if (docSnap.exists) {
            await docRef.set({
              'updatedAt': DateTime.now(),
              'logoutAt': DateTime.now(),
              'isLogin': false,
            }, SetOptions(merge: true));
            // await docRef.delete();
            print("Firestore Save deleteAccount");
          }
          return state;
      }
    } catch (e) {
      print(e);
      print("saveFirestore　Error");
      state = state.copyWith(errorText: e.toString(), hasError: true);
    }
    return state;
  }

  /// 端末に保存
  Future _saveDevice() async {
    final uid = state.uid;
    final email = state.email;
    final password = state.password;
    final userName = state.userName;
    final birthDay = state.birthDay;
    final gender = state.gender;
    final isLogin = state.isLogin;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', uid);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('userName', userName);
    prefs.setString('birthDay', birthDay);
    prefs.setString('gender', gender);
    prefs.setBool('isLogin', isLogin);

    state = state.copyWith(
      uid: uid,
      email: email,
      password: password,
      userName: userName,
      birthDay: birthDay,
      gender: gender,
      isLogin: isLogin,
    );
  }

  ///リセット
  void reset() {
    emailController.clear();
    passwordController.clear();
    userNameController.clear();
    birthdayController.clear();
    genderController.clear();
    createAccountFormKey1.currentState?.reset();
    createAccountFormKey2.currentState?.reset();
    loginFormKey.currentState?.reset();
    loginFocusNode.unfocus();
    createFocusNode1.unfocus();
    createFocusNode2.unfocus();
    state = state.copyWith(
      uid: "",
      email: "",
      password: "",
      userName: "ゲスト",
      birthDay: "",
      gender: "",
      isLogin: false,
      selectGender: "",
      errorText: "",
      isObscure: true,
      isValidEmail: false,
      isSafetyPass: false,
      hasError: false,
    );
  }
}
