import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class ResponseStatus<T> {
  @JsonKey(name: 'success', defaultValue: false, includeIfNull: false)
  bool? success = false;
  @JsonKey(name: 'message', includeIfNull: false)
  T? message;
  @JsonKey(name: 'data', includeIfNull: false)
  T? data;
  @JsonKey(name: 'access_token', includeIfNull: false)
  String? accessToken = "";
  @JsonKey(name: 'statusCode', includeIfNull: false)
  int? statusCode = 0;

  ResponseStatus({
    this.success = false,
    this.message,
    this.data,
    this.accessToken,
    this.statusCode,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) {
    var data = jsonDecode(jsonEncode(json["data"]));
    var message = jsonDecode(jsonEncode(json["data"]));

    final Map factories = <Type, Function>{};

    try {
      T? dataModel;
      T? messageModel;
      if (data != null) dataModel = factories[T](data);
      if (message != null) messageModel = factories[T](message);
      return ResponseStatus<T>(
        success: json["success"],
        statusCode: json["statusCode"],
        message: messageModel ?? json["message"],
        data: dataModel ?? json['data'],
        accessToken: json['access_token'],
      );
    } on NoSuchMethodError {
      return ResponseStatus<T>(
        success: json["success"],
        message: json["message"],
        data: json['data'],
        accessToken: json['access_token'],
        statusCode: json['statusCode'],
      );
    }
  }

  ResponseStatus<T> copyWith({
    bool? success,
    T? message,
    T? data,
    String? accessToken,
    int? statusCode,
  }) {
    return ResponseStatus<T>(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      accessToken: accessToken ?? this.accessToken,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data,
      'access_token': accessToken,
      'statusCode': statusCode,
    };
  }

  ResponseStatus<T> copyFrom(T data, ResponseStatus value) {
    return ResponseStatus(
      success: value.success,
      data: data,
      message: value.message,
      accessToken: value.accessToken,
      statusCode: value.statusCode,
    );
  }
}
