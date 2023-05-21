// final createAccountScreenControllerProvider = StateNotifierProvider<
//     CreateAccountScreenController, CreateAccountScreenState>(
//   (ref) => CreateAccountScreenController(ref: ref),
// );
//
// class CreateAccountScreenController
//     extends StateNotifier<CreateAccountScreenState> with LocatorMixin {
//   CreateAccountScreenController({required this.ref})
//       : super(const CreateAccountScreenState());
//
//   final Ref ref;
//   final formKey = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final focusNode = FocusNode();
//
//   @override
//   void initState() {
//     print("ログイン");
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   ///リセット
//   void reset() {
//     emailController.clear();
//     passwordController.clear();
//
//     state = state.copyWith(
//       email: "",
//       password: "",
//       errorText: "",
//       isObscure: true,
//       isValidEmail: false,
//       isSafetyPass: false,
//       hasError: false,
//     );
//   }
//
//   ///メールアドレスの入力
//   void setEmail(String email) {
//     final regExp = RegExp(
//         r'^[a-zA-Z0-9.!#$%&‘*+-/=?^_`{|}~]+@[a-zA-Z0-9.!#$%&‘*+-/=?^_`{|}~]+\.[a-zA-Z0-9-]+$');
//     final isValidEmail = regExp.hasMatch(email);
//     state = state.copyWith(email: email, isValidEmail: isValidEmail);
//   }
//
//   ///パスワードの入力
//   void setPassword(String password) {
//     final regExp = RegExp(r'^[a-zA-Z0-9]{6,}$');
//     final isSafetyPass = regExp.hasMatch(password);
//     state = state.copyWith(password: password, isSafetyPass: isSafetyPass);
//   }
//
//   /// パスワードの表示
//   void switchObscure() {
//     state = state.copyWith(isObscure: !state.isObscure);
//   }
//
//   ///新規登録
//   Future signUp() async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       // 確認メール送信
//       await FirebaseAuth.instance.currentUser?.sendEmailVerification();
//       print("会員登録成功");
//       state = state.copyWith(hasError: false, isSucceeded: true);
//     } catch (e) {
//       print(e);
//       state = state.copyWith(hasError: true, errorText: e.toString());
//     }
//   }
//
//   ///Googleから登録
//   Future signInWithGoogle() async {
//     try {
//       // 認証フローのトリガー
//       final googleUser = await GoogleSignIn(scopes: [
//         'email',
//       ]).signIn();
//       // リクエストから、認証情報を取得
//       final googleAuth = await googleUser?.authentication;
//       // クレデンシャルを新しく作成
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//       // サインインしたら、UserCredentialを返す
//       return FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       print('${e.code}');
//     } on Exception catch (e) {
//       print('${e.toString()}');
//     }
//   }
// }