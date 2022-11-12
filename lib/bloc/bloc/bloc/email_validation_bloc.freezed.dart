// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_validation_bloc.dart';

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
abstract class $EmailValidationEventCopyWith<$Res> {
  factory $EmailValidationEventCopyWith(EmailValidationEvent value,
          $Res Function(EmailValidationEvent) then) =
      _$EmailValidationEventCopyWithImpl<$Res>;
}

/// @nodoc
abstract class $EmailValidationStateCopyWith<$Res> {
  factory $EmailValidationStateCopyWith(EmailValidationState value,
          $Res Function(EmailValidationState) then) =
      _$EmailValidationStateCopyWithImpl<$Res>;
}

/// @nodoc
abstract class _$$_FormScreenEventSubmitCopyWith<$Res> {
  factory _$$_FormScreenEventSubmitCopyWith(_$_FormScreenEventSubmit value,
          $Res Function(_$_FormScreenEventSubmit) then) =
      __$$_FormScreenEventSubmitCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
abstract class _$$_FormScreenStateCopyWith<$Res> {
  factory _$$_FormScreenStateCopyWith(
          _$_FormScreenState value, $Res Function(_$_FormScreenState) then) =
      __$$_FormScreenStateCopyWithImpl<$Res>;
  $Res call({bool isBusy, FieldError? emailError, bool? submissionSuccess});
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc

class _$_FormScreenEventSubmit implements _FormScreenEventSubmit {
  @override
  final String email;

  const _$_FormScreenEventSubmit(this.email);

  @JsonKey(ignore: true)
  @override
  _$$_FormScreenEventSubmitCopyWith<_$_FormScreenEventSubmit> get copyWith =>
      __$$_FormScreenEventSubmitCopyWithImpl<_$_FormScreenEventSubmit>(
          this, _$identity);

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormScreenEventSubmit &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FormScreenEventSubmit value)
        FormScreenEventSubmit,
  }) {
    return FormScreenEventSubmit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
  }) {
    return FormScreenEventSubmit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
    required TResult orElse(),
  }) {
    if (FormScreenEventSubmit != null) {
      return FormScreenEventSubmit(this);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
    required TResult orElse(),
  }) {
    if (FormScreenEventSubmit != null) {
      return FormScreenEventSubmit(email);
    }
    return orElse();
  }

  @override
  String toString() {
    return 'EmailValidationEvent.FormScreenEventSubmit(email: $email)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) FormScreenEventSubmit,
  }) {
    return FormScreenEventSubmit(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
  }) {
    return FormScreenEventSubmit?.call(email);
  }
}

/// @nodoc

class _$_FormScreenState implements _FormScreenState {
  @override
  @JsonKey()
  final bool isBusy;

  @override
  final FieldError? emailError;
  @override
  final bool? submissionSuccess;
  const _$_FormScreenState(
      {this.isBusy = false, this.emailError, this.submissionSuccess});

  @JsonKey(ignore: true)
  @override
  _$$_FormScreenStateCopyWith<_$_FormScreenState> get copyWith =>
      __$$_FormScreenStateCopyWithImpl<_$_FormScreenState>(this, _$identity);

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(emailError),
      const DeepCollectionEquality().hash(submissionSuccess));

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormScreenState &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality()
                .equals(other.emailError, emailError) &&
            const DeepCollectionEquality()
                .equals(other.submissionSuccess, submissionSuccess));
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FormScreenState value) FormScreenState,
    required TResult Function(_Initial value) initial,
  }) {
    return FormScreenState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
  }) {
    return FormScreenState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (FormScreenState != null) {
      return FormScreenState(this);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (FormScreenState != null) {
      return FormScreenState(isBusy, emailError, submissionSuccess);
    }
    return orElse();
  }

  @override
  String toString() {
    return 'EmailValidationState.FormScreenState(isBusy: $isBusy, emailError: $emailError, submissionSuccess: $submissionSuccess)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)
        FormScreenState,
    required TResult Function() initial,
  }) {
    return FormScreenState(isBusy, emailError, submissionSuccess);
  }

  @override
  void when1(
      {required Null Function() initial,
      required Function(
              bool isBusy, FieldError? emailError, bool? submissionSuccess)
          FormScreenState}) {
    // TODO: implement when1
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
  }) {
    return FormScreenState?.call(isBusy, emailError, submissionSuccess);
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FormScreenState value) FormScreenState,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  String toString() {
    return 'EmailValidationState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)
        FormScreenState,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  void when1(
      {required Null Function() initial,
      required Function(
              bool isBusy, FieldError? emailError, bool? submissionSuccess)
          FormScreenState}) {
    // TODO: implement when1
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
  }) {
    return initial?.call();
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FormScreenEventSubmit value)
        FormScreenEventSubmit,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  String toString() {
    return 'EmailValidationEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) FormScreenEventSubmit,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
  }) {
    return started?.call();
  }
}

/// @nodoc
mixin _$EmailValidationEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FormScreenEventSubmit value)
        FormScreenEventSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FormScreenEventSubmit value)? FormScreenEventSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) FormScreenEventSubmit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? FormScreenEventSubmit,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EmailValidationEventCopyWithImpl<$Res>
    implements $EmailValidationEventCopyWith<$Res> {
  final EmailValidationEvent _value;

  // ignore: unused_field
  final $Res Function(EmailValidationEvent) _then;
  _$EmailValidationEventCopyWithImpl(this._value, this._then);
}

/// @nodoc
mixin _$EmailValidationState {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FormScreenState value) FormScreenState,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FormScreenState value)? FormScreenState,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)
        FormScreenState,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            bool isBusy, FieldError? emailError, bool? submissionSuccess)?
        FormScreenState,
    TResult Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$EmailValidationStateCopyWithImpl<$Res>
    implements $EmailValidationStateCopyWith<$Res> {
  final EmailValidationState _value;

  // ignore: unused_field
  final $Res Function(EmailValidationState) _then;
  _$EmailValidationStateCopyWithImpl(this._value, this._then);
}

/// @nodoc
class __$$_FormScreenEventSubmitCopyWithImpl<$Res>
    extends _$EmailValidationEventCopyWithImpl<$Res>
    implements _$$_FormScreenEventSubmitCopyWith<$Res> {
  __$$_FormScreenEventSubmitCopyWithImpl(_$_FormScreenEventSubmit _value,
      $Res Function(_$_FormScreenEventSubmit) _then)
      : super(_value, (v) => _then(v as _$_FormScreenEventSubmit));

  @override
  _$_FormScreenEventSubmit get _value =>
      super._value as _$_FormScreenEventSubmit;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$_FormScreenEventSubmit(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class __$$_FormScreenStateCopyWithImpl<$Res>
    extends _$EmailValidationStateCopyWithImpl<$Res>
    implements _$$_FormScreenStateCopyWith<$Res> {
  __$$_FormScreenStateCopyWithImpl(
      _$_FormScreenState _value, $Res Function(_$_FormScreenState) _then)
      : super(_value, (v) => _then(v as _$_FormScreenState));

  @override
  _$_FormScreenState get _value => super._value as _$_FormScreenState;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? emailError = freezed,
    Object? submissionSuccess = freezed,
  }) {
    return _then(_$_FormScreenState(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as FieldError?,
      submissionSuccess: submissionSuccess == freezed
          ? _value.submissionSuccess
          : submissionSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$EmailValidationStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$EmailValidationEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

abstract class _FormScreenEventSubmit implements EmailValidationEvent {
  const factory _FormScreenEventSubmit(final String email) =
      _$_FormScreenEventSubmit;

  @JsonKey(ignore: true)
  _$$_FormScreenEventSubmitCopyWith<_$_FormScreenEventSubmit> get copyWith =>
      throw _privateConstructorUsedError;
  String get email;
}

abstract class _FormScreenState implements EmailValidationState {
  const factory _FormScreenState(
      {final bool isBusy,
      final FieldError? emailError,
      final bool? submissionSuccess}) = _$_FormScreenState;

  @JsonKey(ignore: true)
  _$$_FormScreenStateCopyWith<_$_FormScreenState> get copyWith =>
      throw _privateConstructorUsedError;
  FieldError? get emailError;
  bool get isBusy;
  bool? get submissionSuccess;
}

abstract class _Initial implements EmailValidationState {
  const factory _Initial() = _$_Initial;
}

abstract class _Started implements EmailValidationEvent {
  const factory _Started() = _$_Started;
}
