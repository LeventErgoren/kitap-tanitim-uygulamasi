import 'package:flutter/material.dart';

class LoginScreenPicture extends StatelessWidget {
  const LoginScreenPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pictures/book.png',
      height: 120,
      width: 120,
    );
  }
}
