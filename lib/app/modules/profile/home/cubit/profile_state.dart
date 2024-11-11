abstract class ProfileState {}

class LoadingProfileState extends ProfileState {}

class InitialProfileState extends ProfileState {
  final String username;
  final String? name;
  final int? age;
  final String? birthday;
  final String? horoscope;
  final String? horoscopeIcon;
  final String? zodiac;
  final String? zodiacIcon;
  final List<String>? interests;
  final int? height;
  final int? weight;

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
  });
}

class SuccessProfileState extends ProfileState {}

class ProfileMessage extends ProfileState {
  final String? errorMessage;
  ProfileMessage({this.errorMessage});
}

class ProfileLogOut extends ProfileState {}

class EditProfileState extends ProfileState {}
