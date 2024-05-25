import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/tool_tip.dart';
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

  Color get defaultColor => const Color(0xFF75C4BF);

  Color get correctColor => const Color(0xFF44B571);

  Color get incorrectColor => const Color(0xFFFF7777);

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
  List<TargetFocus> learnResultTargets = [];
  final learnResultTarget1 = GlobalKey();
  final learnResultTarget2 = GlobalKey();
  final learnResultTarget3 = GlobalKey();
  final learnResultTarget4 = GlobalKey();

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
    setIsShowLearnResultTutorial(true);
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
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'ここから', style: style),
                    TextSpan(
                      text: '「問題」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'を開始できます', style: style),
                  ],
                ),
              ),
            ),
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "homeTarget2",
          keyTarget: homeTarget2,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'タップしたら', style: style),
                    TextSpan(
                      text: '「詳細設定」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'が表示されます', style: style),
                  ],
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
              align: ContentAlign.bottom,
              padding: padding,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'ここで', style: style),
                    TextSpan(
                      text: '「問題範囲」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'を選択できます', style: style),
                  ],
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
              align: ContentAlign.bottom,
              padding: padding,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'ここで', style: style),
                    TextSpan(
                      text: '「問題数」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'を選択できます', style: style),
                  ],
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
              align: ContentAlign.bottom,
              padding: padding,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'まずは、', style: style),
                    TextSpan(
                      text: '「一問一答」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'で用語を覚えましょう！', style: style),
                  ],
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
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'ここで', style: style),
                    TextSpan(
                      text: '「問題」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'が表示されます。\nタップすると', style: style),
                    TextSpan(
                      text: '「答え」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'が表示されます。', style: style),
                  ],
                ),
              ),
            ),
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
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「知っている」',
                      style: style.copyWith(color: correctColor),
                    ),
                    const TextSpan(text: '用語は', style: style),
                    TextSpan(
                      text: '「右」',
                      style: style.copyWith(color: correctColor),
                    ),
                    const TextSpan(text: 'にスワイプ', style: style),
                  ],
                ),
              ),
            ),
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
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「知らない」',
                      style: style.copyWith(color: incorrectColor),
                    ),
                    const TextSpan(text: '用語は', style: style),
                    TextSpan(
                      text: '「左」',
                      style: style.copyWith(color: incorrectColor),
                    ),
                    const TextSpan(text: 'にスワイプ', style: style),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnTarget2",
          keyTarget: learnTarget2,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「知っている」',
                      style: style.copyWith(color: correctColor),
                    ),
                    TextSpan(
                      text: '「知らない」',
                      style: style.copyWith(color: incorrectColor),
                    ),
                    const TextSpan(text: 'は、\nこのボタンからも操作できます', style: style),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnTarget3",
          keyTarget: learnTarget3,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: CustomToolTip(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「保存」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(
                        text: 'した用語は後から見返せます。\nさっそく一問一答してみましょう！', style: style),
                  ],
                ),
                offsetX: 125,
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
      ],
    );
    learnResultTargets.addAll(
      [
        TargetFocus(
          identify: "learnResultTarget1",
          keyTarget: learnResultTarget1,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: CustomToolTip(
                isUpward: true,
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'おつかれさまでした！\n', style: style),
                    TextSpan(
                      text: '「学習結果」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'がここで確認できます', style: style),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnResultTarget2",
          keyTarget: learnResultTarget2,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding: EdgeInsets.zero,
              child: CustomToolTip(
                isUpward: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「クイズ一覧」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(
                        text: 'から覚えた用語を\nもう一度見返してみましょう', style: style),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnResultTarget3",
          keyTarget: learnResultTarget3,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              // padding: EdgeInsets.zero,
              child: CustomToolTip(
                isUpward: false,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '「再挑戦」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'でもう一度、', style: style),
                    TextSpan(
                      text: '「クイズに挑戦」',
                      style: style.copyWith(color: defaultColor),
                    ),
                    const TextSpan(text: 'で覚えた用語がクイズで出題されます', style: style),
                  ],
                ),
              ),
            )
          ],
          shape: ShapeLightFocus.RRect,
          radius: 10,
        ),
        TargetFocus(
          identify: "learnResultTarget4",
          keyTarget: learnResultTarget4,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              padding:
                  const EdgeInsets.only(top: 0, left: 90, right: 0, bottom: 0),
              child: const CustomToolTip(
                isUpward: true,
                offsetX: 125,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '以上でチュートリアルは終了です！\nおつかれさまでした🎉', style: style),
                  ],
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

  void setIsShowHomeTutorialDone(bool value) {
    state = state.copyWith(isShowHomeTutorialDone: value);
  }

  void setIsShowLearnTutorial(bool value) {
    state = state.copyWith(isShowLearnTutorial: value);
  }

  void setIsShowLearnResultTutorial(bool value) {
    state = state.copyWith(isShowLearnResultTutorial: value);
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
      opacityShadow: 0.8,
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
      opacityShadow: 0.8,
      focusAnimationDuration: const Duration(milliseconds: 600),
      unFocusAnimationDuration: const Duration(milliseconds: 200),
      pulseAnimationDuration: const Duration(milliseconds: 600),
      pulseEnable: true,
      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      initialFocus: 0,
    )..show(context: context);
  }

  void showLearnResultTutorial({
    required BuildContext context,
    required Function(TargetFocus) onClickTarget,
    required Function() onFinish,
  }) {
    tutorialCoachMark = TutorialCoachMark(
      targets: learnResultTargets,
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
      opacityShadow: 0.8,
      focusAnimationDuration: const Duration(milliseconds: 600),
      unFocusAnimationDuration: const Duration(milliseconds: 200),
      pulseAnimationDuration: const Duration(milliseconds: 600),
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
