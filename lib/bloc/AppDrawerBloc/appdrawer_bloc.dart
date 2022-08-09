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
      } else if (event is ContextlessEvent) {
        emit(ContextlessState());
      } else if (event is RewardEvent) {
        emit(RewardState());
      } else if (event is CounterPageEvent) {
        emit(CounterPageState());
      } else if (event is InheritedWidgetEvent) {
        emit(InheritedWidgetState());
      } else if (event is FreezedEvent) {
        emit(FreezedState());
      } else if (event is CalenderEvent) {
        emit(CalenderState());
      }
    });
  }
}
