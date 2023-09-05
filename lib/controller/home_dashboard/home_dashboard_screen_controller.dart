import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider<
    HomeDashboardScreenController, HomeDashboardScreenState>(
  (ref) => HomeDashboardScreenController(ref: ref),
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> with LocatorMixin {
  HomeDashboardScreenController({required this.ref})
      : super(HomeDashboardScreenState()) {
    initState();
  }

  final Ref ref;
  final tabs = ["学習状況", "実績"];

  @override
  void initState() {}

  void tapTabBar(int index) {
    state = state.copyWith(tabIndex: index);
  }
}
