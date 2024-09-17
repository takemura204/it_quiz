import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kentei_quiz/model/quiz_item/quiz_item.dart';

part 'home_search_screen_state.freezed.dart';

@freezed
class HomeSearchScreenState with _$HomeSearchScreenState {
  factory HomeSearchScreenState({
    @Default(false) bool isLoading,
    @Default(false) bool isScrollLoading,
    @Default([]) List<QuizItem> searchQuizItemList,
    @Default("") String searchText,
    @Default([]) List<String> searchKeywords,
    @Default(false) bool isValidSearch,
    @Default(false) bool isNotTextEmpty,
    @Default(false) bool isSavedFilter,
    @Default(50) int maxItemsToDisplay,
  }) = _HomeSearchScreenState;

  HomeSearchScreenState._();
}
