part of 'appdrawer_bloc.dart';

abstract class AppdrawerEvent extends Equatable {
  const AppdrawerEvent();
  @override
  List<Object> get props => [];
}

class HomePageEvent extends AppdrawerEvent {}

class SamplePageEvent extends AppdrawerEvent {}

class ContextlessEvent extends AppdrawerEvent {}

class RewardEvent extends AppdrawerEvent {}

class InheritedWidgetEvent extends AppdrawerEvent {}

class CounterPageEvent extends AppdrawerEvent {}
