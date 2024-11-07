import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login extends Equatable {
  final String? email;
  final String? username;
  final String? password;

  const Login({
    this.email,
    this.username,
    this.password,
  });

  Login copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return Login(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  String toString() {
    return "$email, $username, $password, ";
  }

  @override
  List<Object?> get props => [
        email,
        username,
        password,
      ];
}
