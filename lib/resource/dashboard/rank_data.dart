import 'package:freezed_annotation/freezed_annotation.dart';

part 'rank_data.freezed.dart';
part 'rank_data.g.dart';

@freezed
class RankData with _$RankData {
  const factory RankData({
    required final int rankId, //ランクID
    required final String rankName, //称号の名前
    required final int levelUpScore, //レベルアップする時のスコア
    required final int rankLevel, //称号を獲得する時レベル
    required final int score, //累計スコア
  }) = _RankData;
  factory RankData.fromJson(Map<String, dynamic> json) =>
      _$RankDataFromJson(json);
}
