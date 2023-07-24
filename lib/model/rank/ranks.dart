import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/rank/rank.dart';

part 'ranks.freezed.dart';

@freezed
class Ranks with _$Ranks {
  factory Ranks({
    Rank? rank,
    @Default(false) final bool isLoading,
    @Default(0) final int rankIndex, //現在のランク階級
  }) = _Ranks;
  Ranks._();
}
