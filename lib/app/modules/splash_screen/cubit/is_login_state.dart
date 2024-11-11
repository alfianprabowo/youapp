import 'package:equatable/equatable.dart';

abstract class IsLoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialLoginState extends IsLoginState {}

class LoadingLoginState extends IsLoginState {}

class ResultLoginState extends IsLoginState {
  final bool status;

  ResultLoginState(this.status);

  @override
  List<Object> get props => [status];

  @override
  String toString() {
    return 'ResultLoginState{status: $status}';
  }
}
