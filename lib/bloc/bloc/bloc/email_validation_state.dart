part of 'email_validation_bloc.dart';

@freezed
class EmailValidationState with _$EmailValidationState {
  const factory EmailValidationState.FormScreenState(
      {@Default(false) bool isBusy,
      FieldError? emailError,
      bool? submissionSuccess}) = _FormScreenState;
  const factory EmailValidationState.initial() = _Initial;

  void when1(
      {required Null Function() initial,
      required Function(
              bool isBusy, FieldError? emailError, bool? submissionSuccess)
          FormScreenState}) {}
}
