// import 'package:rxdart/rxdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import 'main_screen_state.dart';

final mainScreenControllerProvider =
    StateNotifierProvider<MainScreenController, MainScreenState>(
  (ref) => MainScreenController(ref: ref),
);

class MainScreenController extends StateNotifier<MainScreenState>
    with LocatorMixin {
  MainScreenController({required this.ref}) : super(const MainScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  Future initState() async {
    final prefs = await SharedPreferences.getInstance();
    final inAppReviewCount =
        prefs.getInt('inAppReviewCount') ?? state.inAppReviewCount;
    state = state.copyWith(inAppReviewCount: inAppReviewCount);
    _saveDevice();
    super.initState();
  }

  ///BottomNavigationBar変更
  void setTabIndex(int index) {
    state = state.copyWith(currentTabIndex: index);
  }

  ///レビュー表示
  Future<void> updateInAppReviewCount() async {
    final updateShowInAppReviewCount = state.inAppReviewCount + 1;
    state = state.copyWith(
        inAppReviewCount: updateShowInAppReviewCount, isShowInAppReview: true);
    _saveDevice();
  }

  void setIsShowInAppReview() {
    if (state.inAppReviewCount % 3 == 0 && state.isShowInAppReview) {
      final inAppReview = InAppReview.instance;
      inAppReview.requestReview();
      state = state.copyWith(isShowInAppReview: false);
    }
  }

  Future _saveDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final inAppReviewCount = state.inAppReviewCount;
    await prefs.setInt('inAppReviewCount', inAppReviewCount);
  }
}
