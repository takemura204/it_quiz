import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  factory Mission({
    String? docId,
    required final int missionId, //ミッションID
    required final String title, //ミッションの名前
    required final int point, //獲得スコア
    @Default(false) bool isReceived, //達成したか
    DateTime? createdAt, //作成日
  }) = _Mission;
  Mission._();

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);

  //FirestoreのDocumentSnapshotオブジェクトまたはJSON形式のデータからBadgeインスタンスを生成
  factory Mission.fromDocumentSnapshot(DocumentSnapshot doc) {
    final json = doc.data()! as Map<String, dynamic>;
    json['docId'] = doc.id;
    return Mission.fromJson(json);
  }

  Map<String, dynamic> toJsonWithoutUnnecessaryFields() {
    return toJson()
      ..remove('docId')
      ..remove('title')
      ..remove('point');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
