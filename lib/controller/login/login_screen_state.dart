import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default(0) final int currentIndex,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String errorText,
    @Default(true) final bool isObscure,
    @Default(false) final bool isValidEmail,
    @Default(false) final bool isSafetyPass,
    @Default(false) final bool hasError,
  }) = _Create;
}
