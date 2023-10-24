import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/user/user.model.dart';
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

  @override
  void initState() {}

  void setData() {
    final selectedChartType = state.selectedChartType;
    final userModel = ref.read(userModelProvider).userCustom;
    final model = ref.read(dashboardModelProvider);
    switch (selectedChartType) {
      case ChartType.quizCount:
        final periodQuizCounts = model.periodQuizCounts;
        final periodDays = model.periodDays;
        final dailyQuizCountGoal = userModel.dailyQuizCountGoal;

        state = state.copyWith(
            unit: "問",
            valueX: periodQuizCounts,
            valueY: dailyQuizCountGoal,
            days: periodDays);
        break;
      case ChartType.duration:
        final periodDuration = model.periodDuration;
        final periodDays = model.periodDays;
        final dailyDurationGoal = userModel.dailyDurationGoal;
        state = state.copyWith(
          unit: "分",
          valueX: periodDuration,
          valueY: dailyDurationGoal,
          days: periodDays,
        );
        break;
      default:
        final periodQuizCounts = model.periodQuizCounts;
        final periodDays = model.periodDays;
        final dailyQuizCountGoal = userModel.dailyQuizCountGoal;
        state = state.copyWith(
            unit: "問",
            valueX: periodQuizCounts,
            valueY: dailyQuizCountGoal,
            days: periodDays);
    }
  }

  void setSelectedChartType(ChartType type) {
    state = state.copyWith(selectedChartType: type);
    setData();
  }

  void setSelectedPeriodType(int tabIndex) {
    if (tabIndex == 0) {
      state = state.copyWith(
          selectedPeriodType: PeriodType.weekly, tabIndex: tabIndex);
    } else if (tabIndex == 1) {
      state = state.copyWith(
          selectedPeriodType: PeriodType.monthly, tabIndex: tabIndex);
    } else {
      state = state.copyWith(
          selectedPeriodType: PeriodType.weekly, tabIndex: tabIndex);
    }
    ref.read(dashboardModelProvider.notifier).loadWeeklyAndMontylyData();
    setData();
  }
}
