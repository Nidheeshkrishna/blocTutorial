import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appdrawer_event.dart';
part 'appdrawer_state.dart';

class AppdrawerBloc extends Bloc<AppdrawerEvent, AppdrawerState> {
  AppdrawerBloc() : super(AppdrawerInitial()) {
    on<AppdrawerEvent>((event, emit) {
      if (event is HomePageEvent) {
        emit(HomePageState());
      } else if (event is SamplePageEvent) {
        emit(TestPageState());
      }
    });
  }
}
