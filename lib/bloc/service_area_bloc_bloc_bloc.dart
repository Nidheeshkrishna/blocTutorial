import 'package:bloc/bloc.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/GetserviceArea.dart';
import 'package:flutter_applicationgoogle_drive/services/fetchareaRest.dart';
import 'package:meta/meta.dart';

part 'service_area_bloc_bloc_event.dart';
part 'service_area_bloc_bloc_state.dart';

class ServiceAreaBlocBlocBloc
    extends Bloc<ServiceAreaBlocBlocEvent, ServiceAreaBlocBlocState> {
  ServiceAreaBlocBlocBloc() : super(ServiceAreaBlocBlocInitial()) {
    on<ServiceAreaBlocBlocEvent>((event, emit) async {
      emit(ServiceAreaLoadingstate());
      try {
        if (event is FetchServiceAraea) {
          final response = await fetchlocation(event.cityid, event.pincode);
          emit(ServiceAreaSuccesss(response));
        }
      } catch (e) {
        emit(ServiceAreaErrorState(e.toString()));
      }
    });
  }
}
