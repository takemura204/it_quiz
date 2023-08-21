// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_quiz_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeQuizScreenState {
  int get itemIndex => throw _privateConstructorUsedError; //クイズ番号
  bool get isSelected => throw _privateConstructorUsedError;
  List<String> get testGroup => throw _privateConstructorUsedError;
  int get selectedTestLength => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeQuizScreenStateCopyWith<HomeQuizScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeQuizScreenStateCopyWith<$Res> {
  factory $HomeQuizScreenStateCopyWith(
          HomeQuizScreenState value, $Res Function(HomeQuizScreenState) then) =
      _$HomeQuizScreenStateCopyWithImpl<$Res, HomeQuizScreenState>;
  @useResult
  $Res call(
      {int itemIndex,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength});
}

/// @nodoc
class _$HomeQuizScreenStateCopyWithImpl<$Res, $Val extends HomeQuizScreenState>
    implements $HomeQuizScreenStateCopyWith<$Res> {
  _$HomeQuizScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemIndex = null,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
  }) {
    return _then(_value.copyWith(
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      testGroup: null == testGroup
          ? _value.testGroup
          : testGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $HomeQuizScreenStateCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int itemIndex,
      bool isSelected,
      List<String> testGroup,
      int selectedTestLength});
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$HomeQuizScreenStateCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemIndex = null,
    Object? isSelected = null,
    Object? testGroup = null,
    Object? selectedTestLength = null,
  }) {
    return _then(_$_Create(
      itemIndex: null == itemIndex
          ? _value.itemIndex
          : itemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      testGroup: null == testGroup
          ? _value._testGroup
          : testGroup // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedTestLength: null == selectedTestLength
          ? _value.selectedTestLength
          : selectedTestLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {this.itemIndex = 0,
      this.isSelected = false,
      final List<String> testGroup = const [],
      this.selectedTestLength = 10})
      : _testGroup = testGroup;

  @override
  @JsonKey()
  final int itemIndex;
//クイズ番号
  @override
  @JsonKey()
  final bool isSelected;
  final List<String> _testGroup;
  @override
  @JsonKey()
  List<String> get testGroup {
    if (_testGroup is EqualUnmodifiableListView) return _testGroup;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_testGroup);
  }

  @override
  @JsonKey()
  final int selectedTestLength;

  @override
  String toString() {
    return 'HomeQuizScreenState(itemIndex: $itemIndex, isSelected: $isSelected, testGroup: $testGroup, selectedTestLength: $selectedTestLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.itemIndex, itemIndex) ||
                other.itemIndex == itemIndex) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            const DeepCollectionEquality()
                .equals(other._testGroup, _testGroup) &&
            (identical(other.selectedTestLength, selectedTestLength) ||
                other.selectedTestLength == selectedTestLength));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemIndex, isSelected,
      const DeepCollectionEquality().hash(_testGroup), selectedTestLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);
}

abstract class _Create implements HomeQuizScreenState {
  const factory _Create(
      {final int itemIndex,
      final bool isSelected,
      final List<String> testGroup,
      final int selectedTestLength}) = _$_Create;

  @override
  int get itemIndex;
  @override //クイズ番号
  bool get isSelected;
  @override
  List<String> get testGroup;
  @override
  int get selectedTestLength;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}
