import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_quiz_screen_state.freezed.dart';

@freezed
class HomeQuizScreenState with _$HomeQuizScreenState {
  const factory HomeQuizScreenState({
    @Default(0) final int itemIndex, //クイズ番号
  }) = _Create;
}
