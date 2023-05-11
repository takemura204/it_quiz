import 'package:freezed_annotation/freezed_annotation.dart';

import 'home_dashboard_screen_controller.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();
  factory HomeDashboardScreenState({
    @Default(-1) final int selectedXIndex,
    @Default(10) final int goalY, //毎日の目標
    @Default(0) final int dayScore, //1日のトータルスコア
    @Default(0) final int weekScore, //1週間のトータルスコア
    @Default(0) final int monthScore, //1ヶ月のトータルスコア
    @Default(0) final int yearScore, //1年間のトータルスコア
    @Default(7) final int selectedDayRange, //
    @Default(0) final int weekOffset, //週の操作
    @Default(0) final int monthOffset, //今月・先月・来月
    @Default(0) final int tabIndex, //タブ
    @Default("") final String dayRangeText, //タブ
    @Default([]) final List<BarData> totalDataList, //全部のスコア(3ヶ月)
    @Default([]) final List<BarData> weeklyDataList, //1週間のスコア
    @Default([]) final List<BarData> monthlyDataList, //1ヶ月のスコア
  }) = _Create;
}
