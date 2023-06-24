import 'package:freezed_annotation/freezed_annotation.dart';

part 'rank_data.freezed.dart';
part 'rank_data.g.dart';

@freezed
class RankData with _$RankData {
  const factory RankData({
    required final int rankId,
    required final String rankName,
    required final int levelScore,
    required final int level,
    required final int rankScore,
  }) = _RankData;
  factory RankData.fromJson(Map<String, dynamic> json) =>
      _$RankDataFromJson(json);
}
