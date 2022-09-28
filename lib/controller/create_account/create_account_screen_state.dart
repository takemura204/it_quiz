import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_screen_state.freezed.dart';

@freezed
class CreateAccountScreenState with _$CreateAccountScreenState {
  const factory CreateAccountScreenState({
    @Default(0) final int currentIndex,
    @Default('') final String email,
    @Default('') final String password,
    @Default(true) final bool isObscure,
    @Default(false) final bool isValidEmail,
    @Default(false) final bool isSafetyPass,
  }) = _Create;
}
