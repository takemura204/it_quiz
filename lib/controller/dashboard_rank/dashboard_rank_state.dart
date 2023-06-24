import 'package:freezed_annotation/freezed_annotation.dart';

import '../../resource/dashboard/rank_data.dart';

part 'dashboard_rank_state.freezed.dart';

@freezed
class DashboardRankState with _$DashboardRankState {
  const DashboardRankState._();
  factory DashboardRankState({
    @Default(false) final bool isLoading,
    @Default([]) final List<RankData> rankDataList, //ランク一覧データ
    RankData? rankData, //ユーザーのランクデータ
    @Default(0) final int rankIndex, //現在のランク階級
  }) = _Create;
}
