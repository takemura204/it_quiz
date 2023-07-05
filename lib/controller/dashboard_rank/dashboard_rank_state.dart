import 'package:freezed_annotation/freezed_annotation.dart';

import '../../resource/rank/rank_data.dart';

part 'dashboard_rank_state.freezed.dart';

@freezed
class DashboardRankState with _$DashboardRankState {
  const DashboardRankState._();
  factory DashboardRankState({
    @Default(false) final bool isLoading,
    RankData? rankData, //ユーザーのランクデータ
    @Default(0) final int rankIndex, //現在のランク階級
    @Default(0) final int mission1Index,
    @Default(0) final int mission2Index,
    @Default(0) final int mission3Index,
  }) = _Create;
}
