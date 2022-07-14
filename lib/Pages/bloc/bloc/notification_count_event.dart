part of 'notification_count_bloc.dart';

abstract class NotificationCountEvent {}

class ChangeNotificationCount extends NotificationCountEvent {
  final String notCount;

  ChangeNotificationCount(this.notCount);
}
