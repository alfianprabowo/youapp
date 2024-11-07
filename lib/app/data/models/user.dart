import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String? email;
  final String? username;
  final String? name;
  final String? birthday;
  final String? horoscope;
  final String? zodiac;
  final int? height;
  final int? weight;
  final List<String>? interests;

  const User({
    this.email,
    this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    this.interests,
  });

  User copyWith({
    String? email,
    String? username,
    String? name,
    String? birthday,
    String? horoscope,
    String? zodiac,
    int? height,
    int? weight,
    List<String>? interests,
  }) {
    return User(
      email: name ?? this.email,
      username: name ?? this.username,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      horoscope: birthday ?? this.horoscope,
      zodiac: birthday ?? this.zodiac,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      interests: interests ?? this.interests,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "$email, $username,$name, $birthday, $horoscope, $zodiac,$height, $weight, $interests, ";
  }

  @override
  List<Object?> get props => [
        email,
        username,
        name,
        birthday,
        horoscope,
        zodiac,
        height,
        weight,
        interests,
      ];
}
