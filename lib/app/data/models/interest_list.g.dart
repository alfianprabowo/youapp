// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestList _$InterestListFromJson(Map<String, dynamic> json) => InterestList(
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InterestListToJson(InterestList instance) =>
    <String, dynamic>{
      'interests': instance.interests,
    };
