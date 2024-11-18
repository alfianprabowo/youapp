import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interest_list.g.dart';

@JsonSerializable()
class InterestList extends Equatable {
  InterestList({
    required this.interests,
  });

  final List<String>? interests;

  InterestList copyWith({
    List<String>? interests,
  }) {
    return InterestList(
      interests: interests ?? this.interests,
    );
  }

  factory InterestList.fromJson(Map<String, dynamic> json) => _$InterestListFromJson(json);

  Map<String, dynamic> toJson() => _$InterestListToJson(this);

  @override
  String toString() {
    return "$interests, ";
  }

  @override
  List<Object?> get props => [
        interests,
      ];
}
