import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_root_screen_state.freezed.dart';

@freezed
class HomeRootScreenState with _$HomeRootScreenState {
  const factory HomeRootScreenState({
    @Default(0) final int currentIndex,
  }) = _Create;
}
