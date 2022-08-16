import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'quiz_learn.freezed.dart';
part 'quiz_learn.g.dart';

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

@freezed
class QuizLearn with _$QuizLearn {
  const QuizLearn._();
  const factory QuizLearn({
    @JsonKey(name: "quizId") //
        required final int quizId,
    @JsonKey(name: "question") //
        required final String question,
    @JsonKey(name: "ans") //
        required final String ans,
    @Default(false)
        final bool isWeak,
  }) = _Create;

  factory QuizLearn.fromJson(Map<String, dynamic> json) =>
      _$QuizLearnFromJson(json);

  // ドキュメントのスナップショットを変換するために利用
  factory QuizLearn.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data()!;
    // doc.idがitemIDのため、copyWithでIDをモデルにコピーする
    return QuizLearn.fromJson(data);
  }
}

Stream<List<QuizLearn>> quizStream() {
  final snapshots = FirebaseFirestore.instance
      .collection('learnQuiz')
      .withConverter<QuizLearn>(
        fromFirestore: (snapshot, _) =>
            QuizLearn.fromDocumentSnapshot(snapshot),
        toFirestore: (obj, _) => obj.toJson(),
      )
      .snapshots();
  final result =
      snapshots.map((qs) => qs.docs.map((qds) => qds.data()).toList());
  return result;
}
