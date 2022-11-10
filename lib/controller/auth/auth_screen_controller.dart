import 'package:flutter/cupertino.dart';
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
}
