import 'package:bloc/bloc.dart';
import 'package:flutter_applicationgoogle_drive/Mixing_Class/ValidationMixin.dart ';
import 'package:flutter_applicationgoogle_drive/Modeles/field_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_validation_bloc.freezed.dart';
part 'email_validation_event.dart';
part 'email_validation_state.dart';

class EmailValidationBloc
    extends Bloc<EmailValidationEvent, EmailValidationState>
    with ValidationMixin {
  EmailValidationBloc() : super(const _Initial()) {
    on<EmailValidationEvent>((event, emit) {
      if (event is _FormScreenEventSubmit) {
        emit(const EmailValidationState.FormScreenState(isBusy: true));
      }
      if (isFieldEmpty(event.toString())) {
        emit(const EmailValidationState.FormScreenState(
            emailError: FieldError.Empty));
        return;
      }
    });
    //emit(const EmailValidationState.FormScreenState(submissionSuccess: true));
  }
}
