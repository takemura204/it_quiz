import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz_item/quiz_item.dart';

part 'home_search_screen_state.freezed.dart';

@freezed
class HomeSearchScreenState with _$HomeSearchScreenState {
  factory HomeSearchScreenState({
    @Default([]) List<QuizItem> quizItemList,
    @Default('') String searchText,
    @Default(false) bool isValidSearch,
    @Default(false) bool isNotTextEmpty,
  }) = _Create;

  HomeSearchScreenState._();
}
