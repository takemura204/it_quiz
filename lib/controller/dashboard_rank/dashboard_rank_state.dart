import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_rank_state.freezed.dart';

@freezed
class DashboardRankState with _$DashboardRankState {
  const DashboardRankState._();
  factory DashboardRankState({
    @Default(0) final int rankIndex, //ランク階級
    @Default(0) final int point,
  }) = _Create;
}

class RankData {
  final String rankName;
  final List<Color> colors;
  final int score;
  final IconData icon;

  RankData(this.rankName, this.colors, this.score, this.icon);
}
