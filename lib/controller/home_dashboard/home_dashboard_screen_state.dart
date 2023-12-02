import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();

  factory HomeDashboardScreenState({
    @Default(false) bool isLoading,
    @Default(0) final int tabIndex,
    @Default(PeriodType.weekly) final PeriodType selectedPeriodType,
    @Default(ChartType.quizCount) final ChartType selectedChartType,
    @Default(0) final int weekOffset, //週の期間選択
    @Default(0) final int monthOffset, //月の期間選択
    @Default([]) final List<int> valueX,
    @Default(0) final int valueY,
    @Default([]) final List<DateTime> days,
    @Default("") final String unitY,
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
