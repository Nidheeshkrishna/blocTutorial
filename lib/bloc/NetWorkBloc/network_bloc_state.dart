part of 'network_bloc_bloc.dart';

@immutable
abstract class NetworkBlocState {}

class NetworkBlocInitial extends NetworkBlocState {}

abstract class NetworkState {}

class ConnectionInitial extends NetworkState {}

class ConnectionSuccess extends NetworkState {}

class ConnectionFailure extends NetworkState {}
