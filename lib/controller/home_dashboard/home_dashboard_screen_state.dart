import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();

  factory HomeDashboardScreenState({
    @Default(false) bool isLoading,
    @Default(-1) final int selectedXIndex,
    @Default(PeriodType.weekly) final PeriodType selectedPeriodType,
    @Default(ChartType.quizCount) final ChartType selectedChartType,
    @Default([]) final List<int> valueX,
    @Default(0) final int valueY,
    @Default([]) final List<DateTime> days,
    @Default("") final String unit,
    @Default(0) final int tabIndex,
  }) = _Create;
}

enum PeriodType {
  weekly,
  monthly,
}

enum ChartType {
  quizCount,
  duration,
}
