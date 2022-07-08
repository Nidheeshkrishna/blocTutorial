import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<ValidationEvent>((event, emit) {
      if (event is ValidEvent) {
        if (event.name.isNotEmpty) {
          if (event.pincode.isNotEmpty) {
            if (event.area.isNotEmpty) {
              emit(ValidationSuccess());
            } else {
              emit(ValidationFailed("Pls enter A Area"));
            }
          } else {
            emit(ValidationFailed("Pls enter A valid Pincode"));
          }
        } else {
          emit(ValidationFailed("Pls enter A valid Name"));
        }
      }
    });
  }
}
