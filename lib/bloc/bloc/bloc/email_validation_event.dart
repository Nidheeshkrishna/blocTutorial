part of 'email_validation_bloc.dart';

@freezed
class EmailValidationEvent with _$EmailValidationEvent {
  const factory EmailValidationEvent.started() = _Started;
  const factory EmailValidationEvent.FormScreenEventSubmit(String email) =
      _FormScreenEventSubmit;
}
