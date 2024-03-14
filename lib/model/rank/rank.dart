import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rank.freezed.dart';
part 'rank.g.dart';

@freezed
class Rank with _$Rank {
  factory Rank({
    required final int rankId, //ランクID
    required final int level, //レベル
    required final int score, //スコア
    @Default("") final String rankName, //称号の名前
    @Default(0) final int levelUpScore, //レベルアップする時のスコア
    @Default("") final String uid,
    DateTime? updateAt, //更新日
  }) = _Rank;
  Rank._();

  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);

  factory Rank.fromDocumentSnapshot(DocumentSnapshot doc) {
    final json = doc.data()! as Map<String, dynamic>;
    json['docId'] = doc.id;
    return Rank.fromJson(json);
  }

  Map<String, dynamic> toJsonWithoutUnnecessaryFields() {
    return toJson()
      ..remove('rankName')
      ..remove('levelUpScore');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
