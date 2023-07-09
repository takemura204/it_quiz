import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/resource/rank/rank.dart';

part 'ranks.freezed.dart';

@freezed
class Ranks with _$Ranks {
  factory Ranks({
    @Default([]) List<Rank> ranks,
  }) = _Ranks;
  Ranks._();

  // Rank? fromDocId({required String? docId}) =>
  //     ranks.firstWhereOrNull((e) => e.docId == docId);
}
