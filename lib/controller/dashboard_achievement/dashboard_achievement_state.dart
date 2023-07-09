import 'package:freezed_annotation/freezed_annotation.dart';

import '../../resource/rank/rank.dart';

part 'dashboard_achievement_state.freezed.dart';

@freezed
class DashboardAchievementState with _$DashboardAchievementState {
  const DashboardAchievementState._();
  factory DashboardAchievementState({
    @Default(false) final bool isLoading,
    Rank? rankData, //ユーザーのランクデータ
    @Default(0) final int rankIndex, //現在のランク階級
    @Default(0) final int mission1Index,
    @Default(0) final int mission2Index,
    @Default(0) final int mission3Index,
  }) = _Create;
}
