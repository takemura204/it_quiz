// import 'package:rxdart/rxdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
  void initState() {
    super.initState();
  }

  ///BottomNavigationBar変更
  void setTabIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
