import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/loggedWidgets/profile_detay.dart';
import 'package:kitap_tanitim_app/models/user.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User u = ref.watch(LoggedUser);

    return SafeArea(
      child: Center(
        child: Column(
          children: [ 
            SizedBox(height: 50),
            Text(
              u.isim + ' ' + u.soyisim,
              style: Texts.userProfileNameTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: u.cinsiyet == "Erkek"
                  ? Renkler.manProfileColor
                  : Renkler.womanProfileColor,
              radius: 75,
              child: Container(
                width: 100,
                height: 100,
                child: u.cinsiyet == "Erkek"
                    ? Image.asset('assets/pictures/man.png')
                    : Image.asset('assets/pictures/woman.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Expanded(
              child: ProfileDetay(),
            ),
          ],
        ),
      ),
    );
  }
}
