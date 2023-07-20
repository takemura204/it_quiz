import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dashboard_screen_state.freezed.dart';

@freezed
class HomeDashboardScreenState with _$HomeDashboardScreenState {
  const HomeDashboardScreenState._();
  factory HomeDashboardScreenState({
    @Default(false) bool isLoading,
    @Default(0) final int tabIndex, //タブ
    @Default(-1) final int selectedXIndex,
  }) = _Create;
}
