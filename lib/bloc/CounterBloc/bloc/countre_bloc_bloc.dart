import 'package:bloc/bloc.dart';

part 'countre_bloc_event.dart';
part 'countre_bloc_state.dart';

class CountreBlocBloc extends Bloc<CountreBlocEvent, CountreBlocState> {
  CountreBlocBloc() : super(CountreBlocSuccessState(0)) {
    on<CountreBlocEvent>((event, emit) {
      if (event is CounterIncrement) {
        emit(CountreBlocSuccessState(state.counter + 1));
      } else if (event is CounterDecrement) {
        emit(CountreBlocSuccessState(state.counter - 1));
      }
    });
  }
}
