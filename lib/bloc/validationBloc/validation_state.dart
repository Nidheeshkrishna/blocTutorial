part of 'validation_bloc.dart';

@immutable
abstract class ValidationState {}

class ValidationInitial extends ValidationState {}

class ValidationSuccess extends ValidationState {
  ValidationSuccess();
}

class ValidationFailed extends ValidationState {
  final String error;
  ValidationFailed(this.error);
}
