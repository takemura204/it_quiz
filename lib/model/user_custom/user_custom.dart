import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_custom.freezed.dart';

@freezed
class UserCustom with _$UserCustom {
  const factory UserCustom({
    @Default(0) final int skinId,
    @Default(10) final int dailyQuizCountGoal,
    @Default(10) final int dailyDurationGoal,
  }) = _UserCustom;
}
