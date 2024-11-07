import 'package:flutter/material.dart';

shortSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    duration: const Duration(seconds: 2),
  ));
}
