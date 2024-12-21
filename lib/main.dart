import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/pages/new_login_page.dart';
import 'package:kitap_tanitim_app/pages/logged_screen.dart';
import 'package:kitap_tanitim_app/pages/my_home_page.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Tanıtım Uygulaması',
      debugShowCheckedModeBanner: false,
      home: NewLoginPage(),
    );
  }
}
