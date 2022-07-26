part of 'countre_bloc_bloc.dart';

abstract class CountreBlocState {
  int counter = 0;
}

class CountreBlocSuccessState extends CountreBlocState {
  @override
  final int counter;
  CountreBlocSuccessState(
    this.counter,
  );
}
