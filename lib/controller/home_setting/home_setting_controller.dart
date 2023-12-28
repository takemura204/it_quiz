import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_setting_state.dart';

final homeSettingProvider =
    StateNotifierProvider<HomeSettingController, HomeSettingState>(
        (ref) => HomeSettingController(ref: ref));

class HomeSettingController extends StateNotifier<HomeSettingState>
    with LocatorMixin {
  HomeSettingController({required this.ref}) : super(const HomeSettingState()) {
    () {
      _initialize();
    }();
  }

  final Ref ref;
  final quizCountController = TextEditingController();
  final quizCount = [5, 10, 20, 30, 40, 50];

  Future _initialize() async {
    // await initTheme();
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  void setSelectedQuizCountGoal(int value) {
    state = state.copyWith(selectedQuizCountGoal: value);
  }
}
