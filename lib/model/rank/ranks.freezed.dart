// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Ranks {
  Rank? get rank => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  int get rankIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RanksCopyWith<Ranks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RanksCopyWith<$Res> {
  factory $RanksCopyWith(Ranks value, $Res Function(Ranks) then) =
      _$RanksCopyWithImpl<$Res, Ranks>;
  @useResult
  $Res call({Rank? rank, bool isLoading, int rankIndex});

  $RankCopyWith<$Res>? get rank;
}

/// @nodoc
class _$RanksCopyWithImpl<$Res, $Val extends Ranks>
    implements $RanksCopyWith<$Res> {
  _$RanksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
    Object? isLoading = null,
    Object? rankIndex = null,
  }) {
    return _then(_value.copyWith(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RankCopyWith<$Res>? get rank {
    if (_value.rank == null) {
      return null;
    }

    return $RankCopyWith<$Res>(_value.rank!, (value) {
      return _then(_value.copyWith(rank: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RanksCopyWith<$Res> implements $RanksCopyWith<$Res> {
  factory _$$_RanksCopyWith(_$_Ranks value, $Res Function(_$_Ranks) then) =
      __$$_RanksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Rank? rank, bool isLoading, int rankIndex});

  @override
  $RankCopyWith<$Res>? get rank;
}

/// @nodoc
class __$$_RanksCopyWithImpl<$Res> extends _$RanksCopyWithImpl<$Res, _$_Ranks>
    implements _$$_RanksCopyWith<$Res> {
  __$$_RanksCopyWithImpl(_$_Ranks _value, $Res Function(_$_Ranks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
    Object? isLoading = null,
    Object? rankIndex = null,
  }) {
    return _then(_$_Ranks(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as Rank?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rankIndex: null == rankIndex
          ? _value.rankIndex
          : rankIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Ranks extends _Ranks {
  _$_Ranks({this.rank, this.isLoading = false, this.rankIndex = 0}) : super._();

  @override
  final Rank? rank;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int rankIndex;

  @override
  String toString() {
    return 'Ranks(rank: $rank, isLoading: $isLoading, rankIndex: $rankIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ranks &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.rankIndex, rankIndex) ||
                other.rankIndex == rankIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rank, isLoading, rankIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RanksCopyWith<_$_Ranks> get copyWith =>
      __$$_RanksCopyWithImpl<_$_Ranks>(this, _$identity);
}

abstract class _Ranks extends Ranks {
  factory _Ranks(
      {final Rank? rank, final bool isLoading, final int rankIndex}) = _$_Ranks;
  _Ranks._() : super._();

  @override
  Rank? get rank;
  @override
  bool get isLoading;
  @override
  int get rankIndex;
  @override
  @JsonKey(ignore: true)
  _$$_RanksCopyWith<_$_Ranks> get copyWith =>
      throw _privateConstructorUsedError;
}
