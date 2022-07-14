import 'package:bloc/bloc.dart';

part 'notification_count_event.dart';
part 'notification_count_state.dart';

class NotificationCountBloc
    extends Bloc<NotificationCountEvent, NotificationCountState> {
  NotificationCountBloc() : super(NotificationCountInitial()) {
    on<NotificationCountEvent>((event, emit) {
      try {
        if (event is ChangeNotificationCount) {
          emit(NotificationCountSuccess(event.notCount));
        }
      } catch (e) {
        emit(NotificationCountFaliure(e.toString()));
      }
    });
  }
}
