import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carasoul_event.dart';
part 'carasoul_state.dart';

class CarasoulBloc extends Bloc<CarasoulEvent, CarasoulState> {
  CarasoulBloc() : super(CarasouInitial()) {
    on<CarasoulEvent>((event, emit) {
      if (event is CarasoulSuccEvent) {
        emit(CarasoulSuccessState(event.index, event.imageList));
      } else if (event is ChangeCarasoulEvent) {
        emit(CarasouChangedState(event.index, event.imageList));
      }
    });
  }
}
