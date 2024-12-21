import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final LoginUserName = StateProvider<String>((ref) {
  return "";
});

final LoginPassword = StateProvider<String>((ref) {
  return "";
});

final LoginKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final SignUpKey = Provider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final Name = StateProvider<String>((ref) {
  return "";
});

final LastName = StateProvider<String>((ref) {
  return "";
});

final Password = StateProvider<String>((ref) {
  return "";
});

final UserName = StateProvider<String>((ref) {
  return "";
});

final Cinsiyet = StateProvider<String>((ref) {
  return "Erkek";
});
