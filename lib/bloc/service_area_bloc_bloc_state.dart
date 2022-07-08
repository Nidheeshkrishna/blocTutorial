part of 'service_area_bloc_bloc_bloc.dart';

@immutable
abstract class ServiceAreaBlocBlocState {}

class ServiceAreaBlocBlocInitial extends ServiceAreaBlocBlocState {}

class ServiceAreaSuccesss extends ServiceAreaBlocBlocState {
  final GetLocationModel pincodes;
  // final String selectedpincode;

  ServiceAreaSuccesss(
    this.pincodes,
    //this.selectedpincode,
  );
}

class ServiceAreaInitial extends ServiceAreaBlocBlocState {
  ServiceAreaInitial();
}

class ServiceAreaErrorState extends ServiceAreaBlocBlocState {
  final error;
  ServiceAreaErrorState(String string, {this.error});
}

class ServiceAreaLoadingstate extends ServiceAreaBlocBlocState {
  final error;
  ServiceAreaLoadingstate({this.error});
}
