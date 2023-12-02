import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/dashboard/dashboard_model.dart';
import '../../model/user/user.model.dart';
import 'home_dashboard_screen_state.dart';

final homeDashboardScreenProvider = StateNotifierProvider.autoDispose<
    HomeDashboardScreenController, HomeDashboardScreenState>(
  (ref) => HomeDashboardScreenController(ref: ref),
);

class HomeDashboardScreenController
    extends StateNotifier<HomeDashboardScreenState> {
  HomeDashboardScreenController({required this.ref})
      : super(HomeDashboardScreenState()) {
    _initState();
  }

  final Ref ref;

  Future _initState() async {
    state = state.copyWith(isLoading: true);
    setChartData();
    state = state.copyWith(isLoading: false);
  }

  void setChartData() {
    final selectedChartType = state.selectedChartType;
    final userModel = ref.read(userModelProvider).userCustom;
    final model = ref.read(dashboardModelProvider);
    switch (selectedChartType) {
      case ChartType.quizCount:
        final periodQuizCounts = model.periodQuizCountList;
        final periodDays = model.periodDays;
        final dailyQuizCountGoal = userModel.dailyQuizCountGoal;

        state = state.copyWith(
            unitY: "問",
            valueX: periodQuizCounts,
            valueY: dailyQuizCountGoal,
            days: periodDays);
        break;
      case ChartType.duration:
        final periodDuration = model.periodDurationList;
        final periodDays = model.periodDays;
        final dailyDurationGoal = userModel.dailyDurationGoal;
        state = state.copyWith(
          unitY: "分",
          valueX: periodDuration,
          valueY: dailyDurationGoal,
          days: periodDays,
        );
        break;
      default:
        final periodQuizCounts = model.periodQuizCountList;
        final periodDays = model.periodDays;
        final dailyQuizCountGoal = userModel.dailyQuizCountGoal;
        state = state.copyWith(
            unitY: "問",
            valueX: periodQuizCounts,
            valueY: dailyQuizCountGoal,
            days: periodDays);
    }
  }

  void setSelectedChartType(ChartType type) {
    state = state.copyWith(selectedChartType: type);
    setChartData();
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
    setChartData();
  }
}
