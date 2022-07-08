part of 'completedetailes_bloc.dart';

@immutable
abstract class CompletedetailesEvent {}

class FetchPinEvent extends CompletedetailesEvent {
  final String cityid;

  FetchPinEvent(this.cityid);
}

class SelectPincodeEvent extends CompletedetailesEvent {
  final String selectedPincode;
  final GetPincodeModel pincodeModel;
  SelectPincodeEvent(this.pincodeModel, this.selectedPincode);
}
