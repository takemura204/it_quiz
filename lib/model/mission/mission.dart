import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  factory Mission({
    String? docId,
    required final int missionId, //ミッションID
    @Default("") final String title, //ミッションの名前
    @Default(0) final int exp, //獲得スコア
    @Default(false) bool isReceived, //受け取ったか？
    DateTime? updatedAt, //作成日
  }) = _Mission;

  Mission._();

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);
}
