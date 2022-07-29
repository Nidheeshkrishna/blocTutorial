// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'demomodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DemoAlbum _$DemoAlbumFromJson(Map<String, dynamic> json) {
  return _DemoAlbum.fromJson(json);
}

/// @nodoc
mixin _$DemoAlbum {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DemoAlbumCopyWith<DemoAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoAlbumCopyWith<$Res> {
  factory $DemoAlbumCopyWith(DemoAlbum value, $Res Function(DemoAlbum) then) =
      _$DemoAlbumCopyWithImpl<$Res>;
  $Res call({int userId, int id, String title});
}

/// @nodoc
class _$DemoAlbumCopyWithImpl<$Res> implements $DemoAlbumCopyWith<$Res> {
  _$DemoAlbumCopyWithImpl(this._value, this._then);

  final DemoAlbum _value;
  // ignore: unused_field
  final $Res Function(DemoAlbum) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DemoAlbumCopyWith<$Res> implements $DemoAlbumCopyWith<$Res> {
  factory _$$_DemoAlbumCopyWith(
          _$_DemoAlbum value, $Res Function(_$_DemoAlbum) then) =
      __$$_DemoAlbumCopyWithImpl<$Res>;
  @override
  $Res call({int userId, int id, String title});
}

/// @nodoc
class __$$_DemoAlbumCopyWithImpl<$Res> extends _$DemoAlbumCopyWithImpl<$Res>
    implements _$$_DemoAlbumCopyWith<$Res> {
  __$$_DemoAlbumCopyWithImpl(
      _$_DemoAlbum _value, $Res Function(_$_DemoAlbum) _then)
      : super(_value, (v) => _then(v as _$_DemoAlbum));

  @override
  _$_DemoAlbum get _value => super._value as _$_DemoAlbum;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_DemoAlbum(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DemoAlbum implements _DemoAlbum {
  const _$_DemoAlbum(
      {required this.userId, required this.id, required this.title});

  factory _$_DemoAlbum.fromJson(Map<String, dynamic> json) =>
      _$$_DemoAlbumFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'DemoAlbum(userId: $userId, id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DemoAlbum &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_DemoAlbumCopyWith<_$_DemoAlbum> get copyWith =>
      __$$_DemoAlbumCopyWithImpl<_$_DemoAlbum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DemoAlbumToJson(this);
  }
}

abstract class _DemoAlbum implements DemoAlbum {
  const factory _DemoAlbum(
      {required final int userId,
      required final int id,
      required final String title}) = _$_DemoAlbum;

  factory _DemoAlbum.fromJson(Map<String, dynamic> json) =
      _$_DemoAlbum.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_DemoAlbumCopyWith<_$_DemoAlbum> get copyWith =>
      throw _privateConstructorUsedError;
}
