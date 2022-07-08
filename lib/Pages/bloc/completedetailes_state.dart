part of 'completedetailes_bloc.dart';

@immutable
class CompletedetailesState {}

class CompletedetailesInitial extends CompletedetailesState {}

class LocationSuccesss extends CompletedetailesState {
  final GetPincodeModel pincodes;
  final String selectedpincode;

  LocationSuccesss(
    this.pincodes,
    this.selectedpincode,
  );
}

class LocationInitial extends CompletedetailesState {
  LocationInitial();
}

class LocationErrorState extends CompletedetailesState {
  final error;
  LocationErrorState(String string, {this.error});
}

class LocationLoadingstate extends CompletedetailesState {
  final error;
  LocationLoadingstate({this.error});
}
