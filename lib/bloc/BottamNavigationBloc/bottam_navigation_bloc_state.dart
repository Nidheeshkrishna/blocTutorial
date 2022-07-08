part of 'bottam_navigation_bloc_bloc.dart';

@immutable
abstract class BottamNavigationBlocState {}

class BottamNavigationBlocInitial extends BottamNavigationBlocState {}

class BottomNavSuccess extends BottamNavigationBlocState {
  final int currentIndex;
  BottomNavSuccess(this.currentIndex);
}
