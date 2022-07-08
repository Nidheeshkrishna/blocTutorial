import 'package:bloc/bloc.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/getpincodemodel.dart';
import 'package:meta/meta.dart';

import '../../services/getLocationRest.dart';

part 'completedetailes_event.dart';
part 'completedetailes_state.dart';

class CompletedetailesBloc
    extends Bloc<CompletedetailesEvent, CompletedetailesState> {
  CompletedetailesBloc() : super(CompletedetailesInitial()) {
    on<CompletedetailesEvent>((event, emit) async {
      emit(LocationLoadingstate());
      try {
        if (event is FetchPinEvent) {
          final response = await fetchPincode(event.cityid);
          emit(LocationSuccesss(response, ""));
        }
      } catch (e) {
        emit(LocationErrorState(e.toString()));
      }
    });
  }
}
