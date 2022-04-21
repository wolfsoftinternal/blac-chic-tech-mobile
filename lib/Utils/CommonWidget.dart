import 'package:flutter/material.dart';

snackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}
