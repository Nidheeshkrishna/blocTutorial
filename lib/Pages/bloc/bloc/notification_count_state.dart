part of 'notification_count_bloc.dart';

class NotificationCountState {}

class NotificationCountInitial extends NotificationCountState {
  NotificationCountInitial();
}

class NotificationCountSuccess extends NotificationCountState {
  final String count;
  NotificationCountSuccess(this.count);
}

class NotificationCountFaliure extends NotificationCountState {
  final String error;
  NotificationCountFaliure(this.error);
}
