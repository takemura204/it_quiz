// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bar_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BarData _$BarDataFromJson(Map<String, dynamic> json) {
  return _BarData.fromJson(json);
}

/// @nodoc
mixin _$BarData {
  List<QuizState> get quizData => throw _privateConstructorUsedError;
  DateTime get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BarDataCopyWith<BarData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarDataCopyWith<$Res> {
  factory $BarDataCopyWith(BarData value, $Res Function(BarData) then) =
      _$BarDataCopyWithImpl<$Res, BarData>;
  @useResult
  $Res call({List<QuizState> quizData, DateTime day});
}

/// @nodoc
class _$BarDataCopyWithImpl<$Res, $Val extends BarData>
    implements $BarDataCopyWith<$Res> {
  _$BarDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizData = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      quizData: null == quizData
          ? _value.quizData
          : quizData // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BarDataCopyWith<$Res> implements $BarDataCopyWith<$Res> {
  factory _$$_BarDataCopyWith(
          _$_BarData value, $Res Function(_$_BarData) then) =
      __$$_BarDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<QuizState> quizData, DateTime day});
}

/// @nodoc
class __$$_BarDataCopyWithImpl<$Res>
    extends _$BarDataCopyWithImpl<$Res, _$_BarData>
    implements _$$_BarDataCopyWith<$Res> {
  __$$_BarDataCopyWithImpl(_$_BarData _value, $Res Function(_$_BarData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quizData = null,
    Object? day = null,
  }) {
    return _then(_$_BarData(
      quizData: null == quizData
          ? _value._quizData
          : quizData // ignore: cast_nullable_to_non_nullable
              as List<QuizState>,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BarData implements _BarData {
  const _$_BarData({required final List<QuizState> quizData, required this.day})
      : _quizData = quizData;

  factory _$_BarData.fromJson(Map<String, dynamic> json) =>
      _$$_BarDataFromJson(json);

  final List<QuizState> _quizData;
  @override
  List<QuizState> get quizData {
    if (_quizData is EqualUnmodifiableListView) return _quizData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizData);
  }

  @override
  final DateTime day;

  @override
  String toString() {
    return 'BarData(quizData: $quizData, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BarData &&
            const DeepCollectionEquality().equals(other._quizData, _quizData) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_quizData), day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BarDataCopyWith<_$_BarData> get copyWith =>
      __$$_BarDataCopyWithImpl<_$_BarData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BarDataToJson(
      this,
    );
  }
}

abstract class _BarData implements BarData {
  const factory _BarData(
      {required final List<QuizState> quizData,
      required final DateTime day}) = _$_BarData;

  factory _BarData.fromJson(Map<String, dynamic> json) = _$_BarData.fromJson;

  @override
  List<QuizState> get quizData;
  @override
  DateTime get day;
  @override
  @JsonKey(ignore: true)
  _$$_BarDataCopyWith<_$_BarData> get copyWith =>
      throw _privateConstructorUsedError;
}
