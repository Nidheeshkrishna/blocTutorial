part of 'service_area_bloc_bloc_bloc.dart';

@immutable
abstract class ServiceAreaBlocBlocEvent {}

class FetchServiceAraea extends ServiceAreaBlocBlocEvent {
  final String cityid;
  final String pincode;

  FetchServiceAraea(this.cityid, this.pincode);
}

class FetchServiceAraPincodeEvent extends ServiceAreaBlocBlocEvent {
  final String selectedPincode;
  final GetLocationModel pincodeModel;
  FetchServiceAraPincodeEvent(this.pincodeModel, this.selectedPincode);
}
