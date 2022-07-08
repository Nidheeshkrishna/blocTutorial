import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottam_navigation_bloc_event.dart';
part 'bottam_navigation_bloc_state.dart';

class BottamNavigationBlocBloc
    extends Bloc<BottamNavigationBlocEvent, BottamNavigationBlocState> {
  BottamNavigationBlocBloc() : super(BottamNavigationBlocInitial()) {
    on<BottamNavigationBlocEvent>((event, emit) {
      if (event is ChangePageEvent) {
        emit(BottomNavSuccess(event.index));
      }
    });
  }
}
