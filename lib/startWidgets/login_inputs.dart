import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/decoration.dart';
import 'package:kitap_tanitim_app/riverpod/providers.dart';

class LoginInputs extends ConsumerStatefulWidget {
  const LoginInputs({super.key});

  @override
  ConsumerState<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends ConsumerState<LoginInputs> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(LoginKey);
    return Padding(
      padding: Constants.standartPadding,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: "Test",
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("Kullanıcı Adı"),
                hintText: 'Kullanıcı Adı',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: Icon(Icons.person_2_outlined),
              ),
              validator: (value) {
                if (value!.length > 0 == false) {
                  return 'Kullanıcı Adınızı Giriniz!';
                }
                return null;
              },
              onSaved: (newValue) {
                ref.read(LoginUserName.notifier).state = newValue!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "1234",
              obscureText: showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: Decorations.inputsBorderRadius,
                ),
                label: Text("Şifre"),
                hintText: 'Şifre',
                hintStyle: Decorations.hintTextStye,
                suffixIcon: IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                  ),
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                ),
              ),
              validator: (value) {
                if (value!.length > 0 == false) {
                  return 'Şifrenizi Giriniz!';
                }
                return null;
              },
              onSaved: (newValue) {
                ref.read(LoginPassword.notifier).state = newValue!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
