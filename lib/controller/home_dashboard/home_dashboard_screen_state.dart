import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  HomeDashboardScreenState._();
  factory HomeDashboardScreenState({
    @Default([]) List<String> tabNames,
    @Default(-1) int selectedIndex,
    @Default(20.0) double maxY,
  }) = _Create;
}
