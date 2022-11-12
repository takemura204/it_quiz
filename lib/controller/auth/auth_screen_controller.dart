import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();
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
}
