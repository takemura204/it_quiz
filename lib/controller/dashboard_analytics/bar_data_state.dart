import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/quiz_item/quiz_item.dart';

part 'bar_data_state.freezed.dart';
part 'bar_data_state.g.dart';

@freezed
class BarData with _$BarData {
  const factory BarData({
    required final List<QuizItem> quizData,
    required final DateTime day,
  }) = _BarData;

  factory BarData.fromJson(Map<String, dynamic> json) =>
      _$BarDataFromJson(json);
}

extension BarDataEX on BarData {
  int get score => quizData.length;

  String get weekDay {
    switch (day.weekday) {
      case 1:
        return "(月)";
      case 2:
        return "(火)";
      case 3:
        return "(水)";
      case 4:
        return "(木)";
      case 5:
        return "(金)";
      case 6:
        return "(土)";
      case 7:
        return "(日)";
      default:
        return "";
    }
  }
}
