import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_test_screen_state.freezed.dart';

@freezed
class HomeTestScreenState with _$HomeTestScreenState {
  HomeTestScreenState._();
  factory HomeTestScreenState({
    @Default([]) List<String> tabNames,
  }) = _Create;
}
