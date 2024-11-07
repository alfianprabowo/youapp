import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../app/utils/constants/app_const.dart';

const storage = FlutterSecureStorage();
// final envKey = (key) => kReleaseMode ? key : "${key}_dev";

envKey(key) {
  return kReleaseMode ? key : "${key}_dev";
}

FutureOr<String?> readByKey(String key) async {
  var tempKey = envKey(key);
  String? value = await storage.read(key: tempKey);
  return value;
}

void deleteAll() async {
  setLoginState(true);
  await storage.deleteAll();
}

Future writeValue(String key, String? value) async {
  return await storage.write(key: envKey(key), value: value);
}
