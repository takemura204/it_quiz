import 'package:freezed_annotation/freezed_annotation.dart';

import '../../untils/enums.dart';

part 'quiz_item.freezed.dart';
part 'quiz_item.g.dart';

@freezed
class QuizItem with _$QuizItem {
  factory QuizItem({
    @Default(0) final int quizId, //問題番号
    @Default('') final String word, //単語
    @Default('') final String comment, //解説
    @Default('') final String question, //問題文
    @Default('') final String ans, //答え
    @Default([]) final List<String> choices, //選択肢
    @Default('') final String source, //出典
    @Default(false) final bool isWeak, //苦手か？
    @Default(false) final bool isSaved, //保存したか?
    @Default(false) final bool isKnow, //知っているか？
    @Default(StatusType.unlearned) final StatusType status, //クイズの状態
    @Default(ImportanceType.normal) final ImportanceType importance, //重要度
    @Default(0) final int lapIndex, //何周目か？
    @Default(true) final bool isPremium, //プレミアムか？
  }) = _QuizItem;

  QuizItem._();

  ///新しくデータを追加するとき、??で初期データを追加する。
  ///例：isTest: json['isTest'] as bool? ?? false,
  factory QuizItem.fromJson(Map<String, dynamic> json) => _$_QuizItem(
        quizId: json['quizId'] as int,
        isWeak: json['isWeak'] as bool,
        isSaved: json['isSaved'] as bool,
        isKnow: json['isKnow'] as bool? ?? false,
        status: StatusTypeExtension.fromJson(json['status'] as String),
        lapIndex: json['lapIndex'] as int,
      );
}
