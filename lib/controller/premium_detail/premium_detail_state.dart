import 'package:freezed_annotation/freezed_annotation.dart';

part 'premium_detail_state.freezed.dart';

@freezed
class PremiumDetailState with _$PremiumDetailState {
  const factory PremiumDetailState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubscribed,
  }) = _PremiumDetailState;
}
