import 'package:freezed_annotation/freezed_annotation.dart';

import 'quiz_item.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

///問題ジャンル
@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required final int id, //問題ID
    required final String category, //問題のジャンル別に分ける
    required final String title, //問題タイトル
    required final bool isCompleted, //全て問題を解いたか
    required final List<QuizItem> quizItemList, //クイズ一覧
    required final int correctNum, //正解数
    required final DateTime? timeStamp, //挑戦日
  }) = _Quiz;
  Quiz._();
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
