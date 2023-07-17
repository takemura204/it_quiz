import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/rank/rank.dart';

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
    @Default('') final String timeLimit, // 次の日の00:00までの時間
  }) = _Create;
}
