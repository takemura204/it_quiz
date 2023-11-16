import 'package:freezed_annotation/freezed_annotation.dart';

part 'admob_state.freezed.dart';

@freezed
class AdMobState with _$AdMobState {
  const factory AdMobState({
    @Default(false) final bool isLoading,
  }) = _Create;
}