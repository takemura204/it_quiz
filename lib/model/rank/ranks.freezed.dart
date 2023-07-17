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
  List<Rank> get ranks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RanksCopyWith<Ranks> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RanksCopyWith<$Res> {
  factory $RanksCopyWith(Ranks value, $Res Function(Ranks) then) =
      _$RanksCopyWithImpl<$Res, Ranks>;
  @useResult
  $Res call({List<Rank> ranks});
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
    Object? ranks = null,
  }) {
    return _then(_value.copyWith(
      ranks: null == ranks
          ? _value.ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<Rank>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RanksCopyWith<$Res> implements $RanksCopyWith<$Res> {
  factory _$$_RanksCopyWith(_$_Ranks value, $Res Function(_$_Ranks) then) =
      __$$_RanksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Rank> ranks});
}

/// @nodoc
class __$$_RanksCopyWithImpl<$Res> extends _$RanksCopyWithImpl<$Res, _$_Ranks>
    implements _$$_RanksCopyWith<$Res> {
  __$$_RanksCopyWithImpl(_$_Ranks _value, $Res Function(_$_Ranks) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ranks = null,
  }) {
    return _then(_$_Ranks(
      ranks: null == ranks
          ? _value._ranks
          : ranks // ignore: cast_nullable_to_non_nullable
              as List<Rank>,
    ));
  }
}

/// @nodoc

class _$_Ranks extends _Ranks {
  _$_Ranks({final List<Rank> ranks = const []})
      : _ranks = ranks,
        super._();

  final List<Rank> _ranks;
  @override
  @JsonKey()
  List<Rank> get ranks {
    if (_ranks is EqualUnmodifiableListView) return _ranks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ranks);
  }

  @override
  String toString() {
    return 'Ranks(ranks: $ranks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ranks &&
            const DeepCollectionEquality().equals(other._ranks, _ranks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ranks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RanksCopyWith<_$_Ranks> get copyWith =>
      __$$_RanksCopyWithImpl<_$_Ranks>(this, _$identity);
}

abstract class _Ranks extends Ranks {
  factory _Ranks({final List<Rank> ranks}) = _$_Ranks;
  _Ranks._() : super._();

  @override
  List<Rank> get ranks;
  @override
  @JsonKey(ignore: true)
  _$$_RanksCopyWith<_$_Ranks> get copyWith =>
      throw _privateConstructorUsedError;
}
