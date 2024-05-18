import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'tutorial_state.dart';

final tutorialControllerProvider =
    StateNotifierProvider.autoDispose<TutorialController, TutorialState>(
  (ref) => TutorialController(ref: ref),
);

class TutorialController extends StateNotifier<TutorialState> {
  TutorialController({required this.ref}) : super(TutorialState()) {
    initState();
  }

  final Ref ref;
  late TutorialCoachMark tutorialCoachMark;
  final target1 = GlobalKey(); // 最初のカードのキーを保存
  List<TargetFocus> targets = [];

  void initState() {
    loadState();
    _initTargets();
  }

  ///チュートリアルモーダル表示
  Future loadState() async {
    final prefs = await SharedPreferences.getInstance();
    // final isShowTutorialModal = prefs.getBool('isShowTutorialModal') ?? true;
    final isShowTutorialModal = true;
    state = state.copyWith(isShowTutorialModal: isShowTutorialModal);
    _saveDevice();
  }

  void setIsShowTutorialModal(bool value) {
    state = state.copyWith(isShowTutorialModal: value);
    _saveDevice();
  }

  void _initTargets() {
    targets.add(
      TargetFocus(
        identify: "First Quiz",
        keyTarget: target1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "ここからクイズを開始してください！",
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 10,
      ),
    );
  }

  void setIsShowTarget1(bool value) {
    state = state.copyWith(isShowTarget1: value);
  }

// TutorialController クラスのメソッド修正
  void showTutorial(BuildContext context) {
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: context.backgroundColor,
      textSkip: "スキップ",
      textStyleSkip: const TextStyle(color: Colors.black87),
      paddingFocus: 10,
      opacityShadow: 0.8,
    )..show(context: context);
  }

  ///端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final isShowTutorialModal = state.isShowTutorialModal;
    await prefs.setBool('isShowTutorialModal', isShowTutorialModal);
  }
}
