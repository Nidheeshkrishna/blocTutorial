
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:meta/meta.dart';

part 'network_bloc_event.dart';
part 'network_bloc_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectionInitial()) {
    on<NetworkEvent>((event, emit) async {
      emit(ConnectionInitial());
      try {
        if (event is ListenConnection) {
          DataConnectionChecker().onStatusChange.listen((status) {
            add(ConnectionChanged(status == DataConnectionStatus.disconnected
                ? ConnectionFailure()
                : ConnectionSuccess()));
          });
        } else if (event is ConnectionChanged) {
          emit(event.connection);
        }
      } catch (e) {
        emit(ConnectionFailure());
      }
    });
  }
}
