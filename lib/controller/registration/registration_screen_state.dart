import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_screen_state.freezed.dart';

@freezed
abstract class RegistrationScreenState with _$RegistrationScreenState {
  const factory RegistrationScreenState({
    @Default(0) final int currentIndex,
    @Default('') final String email,
    @Default('') final String password,
    @Default('') final String errorText,
    @Default(true) final bool isObscure,
    @Default(false) final bool isValidEmail,
    @Default(false) final bool isSafetyPass,
    @Default(false) final bool isSucceeded,
    @Default(false) final bool hasError,
  }) = _Create;
}
