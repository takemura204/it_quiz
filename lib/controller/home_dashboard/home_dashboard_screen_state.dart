import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();
  const factory HomeDashboardScreenState({
    @Default([]) final List<String> tabNames,
    @Default(-1) final int selectedIndex,
    @Default(10) final int goalY,
    @Default(0) final int dayScore,
  }) = _Create;
}
