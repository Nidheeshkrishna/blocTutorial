part of 'email_validation_bloc.dart';

@freezed
class EmailValidationState with _$EmailValidationState {
  const factory EmailValidationState.initial() = _Initial;
  const factory EmailValidationState.FormScreenState(
      {@Default(false) bool isBusy,
      FieldError? emailError,
      bool? submissionSuccess}) = _FormScreenState;
}
