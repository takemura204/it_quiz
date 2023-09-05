import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'dashboard_achievement_state.dart';

final dashboardAchievementProvider = StateNotifierProvider<
    DashboardAchievementController, DashboardAchievementState>(
  (ref) => DashboardAchievementController(ref: ref),
);

class DashboardAchievementController
    extends StateNotifier<DashboardAchievementState> with LocatorMixin {
  DashboardAchievementController({required this.ref})
      : super(DashboardAchievementState()) {
    initState();
  }

  final Ref ref;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
