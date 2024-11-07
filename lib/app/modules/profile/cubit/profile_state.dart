abstract class ProfileState {}

class LoadingProfileState extends ProfileState {}

class InitialProfileState extends ProfileState {
  final String username;
  final String name;
  final int age;
  final String birthday;
  final String horoscope;
  final String horoscopeIcon;
  final String zodiac;
  final String zodiacIcon;
  final List<String> interests;
  final int height;
  final int weight;

  InitialProfileState({
    required this.username,
    required this.name,
    required this.age,
    required this.birthday,
    required this.horoscope,
    required this.horoscopeIcon,
    required this.zodiac,
    required this.zodiacIcon,
    required this.interests,
    required this.height,
    required this.weight,
  });
}

class SuccessProfileState extends ProfileState {}

class ProfileMessage extends ProfileState {
  final String? errorMessage;
  ProfileMessage({this.errorMessage});
}

class ProfileLogOut extends ProfileState {}

class EditProfileState extends ProfileState {}
