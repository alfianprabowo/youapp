abstract class UpdateInterestState {}

// class InitialUpdateInterestState extends UpdateInterestState {}

class LoadingUpdateInteresState extends UpdateInterestState {}

class FailureUpdateInterestState extends UpdateInterestState {
  final String? errorMessage;
  FailureUpdateInterestState({this.errorMessage});

  @override
  String toString() {
    return 'FailureLoginState{errorMessage: $errorMessage}';
  }
}

class SuccessUpdateInterestState extends UpdateInterestState {
  final String? successMessage;
  SuccessUpdateInterestState({this.successMessage});
}

class InitialUpdateInterestState extends UpdateInterestState {}

class SuccessUpdateInteresState extends UpdateInterestState {}
