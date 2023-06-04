import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'dashboard_rank_state.dart';

final dashboardRankProvider =
    StateNotifierProvider<DashboardRankController, DashboardRankState>(
  (ref) => DashboardRankController(ref: ref),
);

class DashboardRankController extends StateNotifier<DashboardRankState>
    with LocatorMixin {
  DashboardRankController({required this.ref}) : super(DashboardRankState()) {
    initState();
  }

  final Ref ref;
  final rankData = [
    // ビギナーランク
    RankData("ビギナーランク", [Color(0xFFE0F7FA), Color(0xFF00838F)], 200,
        Icons.grade_rounded),

    // ルーキーランク
    RankData("ルーキーランク", [Color(0xFFE8F5E9), Color(0xFF1B5E20)], 400,
        Icons.stars_rounded),

    // ブロンズランク
    RankData("ブロンズランク", [Color(0xFFFFF8E1), Color(0xFFFF6F00)], 600,
        Icons.emoji_events_rounded),

    // シルバーランク
    RankData("シルバーランク", [Color(0xFFECEFF1), Color(0xFF263238)], 800,
        Icons.verified_rounded),

    // ゴールドランク
    RankData("ゴールドランク", [Color(0xFFFFF9C4), Color(0xFFFFA000)], 1000,
        Icons.verified_user_rounded),

    // プラチナランク
    RankData("プラチナランク", [Color(0xFFE1F5FE), Color(0xFF01579B)], 1200,
        Icons.shield_rounded),

    // チャンピオンランク
    RankData("チャンピオンランク", [Color(0xFFE0F2F1), Color(0xFF004D40)], 1400,
        Icons.military_tech_rounded),

    // マスターランク
    RankData("マスターランク", [Color(0xFFF3E5F5), Color(0xFF4A148C)], 1600,
        Icons.emoji_flags_rounded),

    // レジェンドランク
    RankData("レジェンドランク", [Color(0xFFFFEBEE), Color(0xFFB71C1C)], 1800,
        Icons.king_bed_rounded),
  ];

  @override
  void initState() {}

  void tap(int index) {
    final limit = rankData.length;

    if (index >= limit - 1) {
      state = state.copyWith(rankIndex: 0);
    } else {
      state = state.copyWith(rankIndex: index + 1);
    }
    print(state.rankIndex);
  }
}
