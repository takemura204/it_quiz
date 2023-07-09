import 'package:freezed_annotation/freezed_annotation.dart';

part 'rank.freezed.dart';
part 'rank.g.dart';

@freezed
class Rank with _$Rank {
  const factory Rank({
    required final int rankId, //ランクID
    required final String rankName, //称号の名前
    required final int levelUpScore, //レベルアップする時のスコア
    required final int rankLevel, //称号を獲得する時レベル
    required final int score, //累計スコア
  }) = _Rank;
  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);
}
