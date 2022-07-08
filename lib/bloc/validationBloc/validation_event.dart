part of 'validation_bloc.dart';

@immutable
abstract class ValidationEvent {}

class ValidEvent extends ValidationEvent {
  final String name;
  final String cityid;
  final String pincode;
  final String area;

  ValidEvent(this.name, this.cityid, this.pincode, this.area);
}

class FetchServiceAraEvent extends ValidationEvent {
  //final String selectedPincode;
  //final GetLocationModel pincodeModel;
  FetchServiceAraEvent();
}
