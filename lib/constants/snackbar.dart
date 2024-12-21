import 'package:flutter/material.dart';

class SnackbarGoster {
  static snackBarGoster(String metin, BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(metin),
      duration: Duration(seconds: 3),
    ));
  }
}
