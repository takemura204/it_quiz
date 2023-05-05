import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();
  const factory HomeDashboardScreenState({
    @Default([]) final List<String> tabNames,
    @Default(-1) final int selectedIndex,
    @Default(20.0) final double maxY,
  }) = _Create;
}
