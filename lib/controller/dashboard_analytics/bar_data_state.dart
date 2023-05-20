import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import '../quiz/quiz_state.dart';

class BarData {
  BarData(this.dailyData, this.day)
      : weekDay = _getWeekDayString(day),
        score = dailyData.length;

  final List<QuizState> dailyData;
  final int score;
  final DateTime day;
  final String weekDay;

  Map<String, dynamic> toJson() {
    return {
      'dailyData': dailyData
          .map((quizState) => quizState.toJson())
          .toList(), // もしQuizStateクラスにtoJsonメソッドがなければ、それも追加する必要があります。
      'score': score,
      'day': day.toIso8601String(),
      'weekDay': weekDay,
    };
  }

  static String _getWeekDayString(DateTime dateTime) {
    // 1が月曜日、7が日曜日
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }
}

class CustomBarChartRodData extends BarChartRodData {
  CustomBarChartRodData({
    required int toY,
    required Color color,
    required double width,
    required BorderRadius borderRadius,
  }) : super(
            toY: toY.toDouble(),
            color: color,
            width: width,
            borderRadius: borderRadius);
}
