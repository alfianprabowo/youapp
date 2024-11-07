abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String? errorMessage;
  FailureLoginState({this.errorMessage});

  @override
  String toString() {
    return 'FailureLoginState{errorMessage: $errorMessage}';
  }
}

class SuccessLoginState extends LoginState {
  final String? successMessage;
  SuccessLoginState({this.successMessage});
}
