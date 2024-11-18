abstract class ProfileState {}

class LoadingProfileState extends ProfileState {}

class InitialProfileState extends ProfileState {
  String username;
  String? name;
  int? age;
  String? birthday;
  String? horoscope;
  String? horoscopeIcon;
  String? zodiac;
  String? zodiacIcon;
  List<String>? interests;
  int? height;
  int? weight;
  bool isUpdating;

  InitialProfileState({
    required this.username,
    this.name,
    this.age,
    this.birthday,
    this.horoscope,
    this.horoscopeIcon,
    this.zodiac,
    this.zodiacIcon,
    this.interests,
    this.height,
    this.weight,
    this.isUpdating = false,
  });
}

class SuccessProfileState extends ProfileState {}

class ProfileMessage extends ProfileState {
  final String? errorMessage;
  ProfileMessage({this.errorMessage});
}

class ProfileLogOut extends ProfileState {}

class EditProfileState extends ProfileState {}

class SuccessEditProfileState extends ProfileState {}

class FailedEditProfileState extends ProfileState {
  final String? errorMessage;
  FailedEditProfileState({this.errorMessage});

  @override
  String toString() {
    return 'FailureUpdateProfileState{errorMessage: $errorMessage}';
  }
}
