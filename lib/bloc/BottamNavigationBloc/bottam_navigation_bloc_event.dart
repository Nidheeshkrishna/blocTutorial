part of 'bottam_navigation_bloc_bloc.dart';

@immutable
abstract class BottamNavigationBlocEvent {}

class AppStarted extends BottamNavigationBlocEvent {
  @override
  String toString() => 'AppStarted';
}

class ChangePageEvent extends BottamNavigationBlocEvent {
  final int index;

  ChangePageEvent(this.index);
}
