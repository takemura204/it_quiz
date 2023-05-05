// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_color_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingColorState {
  ThemeData? get themeData => throw _privateConstructorUsedError;
  MaterialColor? get mainColor => throw _privateConstructorUsedError;
  int get themeId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingColorStateCopyWith<SettingColorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingColorStateCopyWith<$Res> {
  factory $SettingColorStateCopyWith(
          SettingColorState value, $Res Function(SettingColorState) then) =
      _$SettingColorStateCopyWithImpl<$Res, SettingColorState>;
  @useResult
  $Res call(
      {ThemeData? themeData,
      MaterialColor? mainColor,
      int themeId,
      bool isLoading});
}

/// @nodoc
class _$SettingColorStateCopyWithImpl<$Res, $Val extends SettingColorState>
    implements $SettingColorStateCopyWith<$Res> {
  _$SettingColorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = freezed,
    Object? mainColor = freezed,
    Object? themeId = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      mainColor: freezed == mainColor
          ? _value.mainColor
          : mainColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor?,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $SettingColorStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ThemeData? themeData,
      MaterialColor? mainColor,
      int themeId,
      bool isLoading});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$SettingColorStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = freezed,
    Object? mainColor = freezed,
    Object? themeId = null,
    Object? isLoading = null,
  }) {
    return _then(_$_Create(
      themeData: freezed == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData?,
      mainColor: freezed == mainColor
          ? _value.mainColor
          : mainColor // ignore: cast_nullable_to_non_nullable
              as MaterialColor?,
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Create extends _Create {
  const _$_Create(
      {this.themeData,
      this.mainColor,
      this.themeId = 0,
      this.isLoading = false})
      : super._();

  @override
  final ThemeData? themeData;
  @override
  final MaterialColor? mainColor;
  @override
  @JsonKey()
  final int themeId;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SettingColorState(themeData: $themeData, mainColor: $mainColor, themeId: $themeId, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData) &&
            (identical(other.mainColor, mainColor) ||
                other.mainColor == mainColor) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, themeData, mainColor, themeId, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create extends SettingColorState {
  const factory _Create(
      {final ThemeData? themeData,
      final MaterialColor? mainColor,
      final int themeId,
      final bool isLoading}) = _$_Create;
  const _Create._() : super._();

  @override
  ThemeData? get themeData;
  @override
  MaterialColor? get mainColor;
  @override
  int get themeId;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
