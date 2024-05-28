import 'dart:io';
import 'dart:math';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_setting_state.dart';

final homeSettingProvider =
    StateNotifierProvider<HomeSettingController, HomeSettingState>(
        (ref) => HomeSettingController(ref: ref));

class HomeSettingController extends StateNotifier<HomeSettingState>
    with LocatorMixin {
  HomeSettingController({required this.ref}) : super(const HomeSettingState()) {
    () {
      _initState();
    }();
  }

  final Ref ref;
  final quizCountController = TextEditingController();
  final quizCount = [10, 20, 30, 40, 50];

  Future _initState() async {
    setPremiumCardIndex();
  }

  @override
  Future dispose() async {
    super.dispose();
  }

  void setSelectedQuizCountGoal(int value) {
    state = state.copyWith(selectedQuizCountGoal: value);
  }

  void setPremiumCardIndex() {
    final randomIndex = Random().nextInt(9) + 1; // 1 から 9 のランダムな数値を生成
    state = state.copyWith(premiumCardIndex: randomIndex);
  }

  Future sendAppReview() async {
    ///アプリストアに遷移
    if (Platform.isAndroid) {
      // final googlePlayUri = Uri.parse(
      //     'https://play.google.com/store/apps/details?id=jp.quiz.it');
      // if (await canLaunchUrl(googlePlayUri)) {
      //   await launchUrl(googlePlayUri);
      // }
    } else if (Platform.isIOS) {
      final appStoreUri = Uri.parse(
          'itms-apps://itunes.apple.com/app/6479543578?action=write-review');
      if (await canLaunchUrl(appStoreUri)) {
        await launchUrl(appStoreUri);
      }
    }
  }
}
