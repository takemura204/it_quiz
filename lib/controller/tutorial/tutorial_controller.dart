import 'dart:ui';

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
  List<TargetFocus> homeTargets = [];
  final homeTarget1 = GlobalKey();
  final homeTarget2 = GlobalKey();
  final homeTarget3 = GlobalKey();
  final homeTarget4 = GlobalKey();
  final homeTarget5 = GlobalKey();
  List<TargetFocus> learnTargets = [];
  final learnTarget1 = GlobalKey();
  final learnTarget2 = GlobalKey();
  final learnTarget3 = GlobalKey();

  void initState() {
    loadState();
    _initTargets();
  }

  ///チュートリアルモーダル表示
  Future loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final isShowTutorialModal = prefs.getBool('isShowTutorialModal') ?? true;
    // final isShowTutorialModal = true;
    state = state.copyWith(isShowTutorialModal: isShowTutorialModal);
    setIsShowLearnTutorial(true);
    _saveDevice();
  }

  void setIsShowTutorialModal(bool value) {
    state = state.copyWith(isShowTutorialModal: value);
    _saveDevice();
  }

  void _initTargets() {
    const style = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54);
    const padding = EdgeInsets.all(5);
    homeTargets.addAll(
      [
        TargetFocus(
          identify: "homeTarget1",
          keyTarget: homeTarget1,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: padding,
              child: const Center(
                child: Text(
                  "ここから問題を開始できます",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "homeTarget2",
          keyTarget: homeTarget2,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              padding: padding,
              child: const Center(
                child: Text(
                  "タップしたら、問題の詳細設定が表示されます",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "homeTarget3",
          keyTarget: homeTarget3,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              padding: padding,
              child: const Center(
                child: Text(
                  "ここで問題範囲を選択できます",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "homeTarget4",
          keyTarget: homeTarget4,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              padding: padding,
              child: const Center(
                child: Text(
                  "ここで問題数を選択できます",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "homeTarget5",
          keyTarget: homeTarget5,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              padding: padding,
              child: const Center(
                child: Text(
                  "まずは、一問一答で用語を覚えてみましょう！",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
      ],
    );
    learnTargets.addAll(
      [
        TargetFocus(
          identify: "learnTarget1-tap",
          keyTarget: learnTarget1,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: const Center(
                child: Text(
                  "タップすると、答えが表示されます。",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnTarget1-right",
          keyTarget: learnTarget1,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: const Center(
                child: Text(
                  "知っている用語は右にスワイプ",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnTarget1-left",
          keyTarget: learnTarget1,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: const Center(
                child: Text(
                  "知らない用語は左にスワイプしましょう",
                  style: style,
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
      ],
    );
  }

  void setIsShowHomeTutorial(bool value) {
    state = state.copyWith(isShowHomeTutorial: value);
  }

  void setIsShowLearnTutorial(bool value) {
    state = state.copyWith(isShowLearnTutorial: value);
  }

  void setIsShowTarget3(bool value) {
    state = state.copyWith(isShowTarget3: value);
  }

  void setIsShowTapAnimation(bool value) {
    state = state.copyWith(isShowTapAnimation: value);
  }

  void setIsShowSwipeRightAnimation(bool value) {
    state = state.copyWith(isShowSwipeRightAnimation: value);
  }

  void setIsShowSwipeLeftAnimation(bool value) {
    state = state.copyWith(isShowSwipeLeftAnimation: value);
  }

// TutorialController クラスのメソッド修正
  void showHomeTutorial({
    required BuildContext context,
    required Function(TargetFocus) onClickTarget,
    required Function() onFinish,
  }) {
    tutorialCoachMark = TutorialCoachMark(
      targets: homeTargets,
      colorShadow: context.backgroundColor,
      textSkip: "SKIP",
      textStyleSkip: const TextStyle(color: Colors.black87),
      paddingFocus: 0,
      alignSkip: Alignment.bottomRight,
      skipWidget: const Text("Skip Tutorial"),
      showSkipInLastTarget: false,
      onFinish: onFinish,
      onClickTarget: onClickTarget,
      onClickOverlay: (target) =>
          print("Clicked on overlay of: ${target.identify}"),
      hideSkip: true,
      useSafeArea: true,
      opacityShadow: 0.9,
      focusAnimationDuration: const Duration(milliseconds: 600),
      unFocusAnimationDuration: const Duration(milliseconds: 200),
      pulseAnimationDuration: const Duration(milliseconds: 600),
      pulseEnable: true,
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      initialFocus: 0,
    )..show(context: context);
  }

  void showLearnTutorial({
    required BuildContext context,
    required Function(TargetFocus) onClickTarget,
    required Function() onFinish,
  }) {
    tutorialCoachMark = TutorialCoachMark(
      targets: learnTargets,
      colorShadow: context.backgroundColor,
      textSkip: "SKIP",
      textStyleSkip: const TextStyle(color: Colors.black87),
      paddingFocus: 0,
      alignSkip: Alignment.bottomRight,
      skipWidget: const Text("Skip Tutorial"),
      showSkipInLastTarget: false,
      onFinish: onFinish,
      onClickTarget: onClickTarget,
      onClickOverlay: (target) =>
          print("Clicked on overlay of: ${target.identify}"),
      hideSkip: true,
      useSafeArea: true,
      opacityShadow: 0.9,
      focusAnimationDuration: const Duration(milliseconds: 500),
      unFocusAnimationDuration: const Duration(milliseconds: 300),
      pulseAnimationDuration: const Duration(milliseconds: 1000),
      pulseEnable: false,
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      initialFocus: 0,
    )..show(context: context);
  }

  ///端末保存
  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final isShowTutorialModal = state.isShowTutorialModal;
    await prefs.setBool('isShowTutorialModal', isShowTutorialModal);
  }
}
