import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz/quiz.dart';
import '../../untils/enums.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();

  factory HomeDashboardScreenState({
    @Default(false) bool isLoading,
    @Default(0) final int tabIndex,
    @Default(PeriodType.weekly) final PeriodType selectedPeriodType,
    @Default(ChartType.quizCount) final ChartType selectedChartType,
    @Default([]) final List<int> valueX,
    @Default(0) final int valueY,
    @Default([]) final List<DateTime> days,
    @Default("") final String unitY,

    ///Piriod
    @Default([]) final List<Quiz> periodQuizList,
    @Default([]) final List<int> periodDurationList,
    @Default([]) final List<int> periodQuizCountList,
    @Default([]) final List<DateTime> periodDays,
    @Default(0) final int periodDuration,
    @Default(0) final int periodQuizCount,
    @Default(0) final int periodQuizCorrectCount,

    ///期間
    DateTime? startPeriodRange, // 今週の月曜日の日付
    DateTime? endPeriodRange, // 今週の日曜日の日付
    @Default(0) final int weekOffset, //週の期間選択
    @Default(0) final int monthOffset, //月の期間選択
  }) = _Create;
}
