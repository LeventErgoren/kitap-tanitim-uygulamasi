import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/models/user.dart';
import 'package:kitap_tanitim_app/riverpod/loggedUser.dart';

class ProfileDetay extends ConsumerStatefulWidget {
  const ProfileDetay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileDetayState();
}

class _ProfileDetayState extends ConsumerState<ProfileDetay> {
  bool sifre = false;

  @override
  Widget build(BuildContext context) {
    User u = ref.watch(LoggedUser);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.person,
                size: 30,
              ),
              InkWell(
                child: sifre
                    ? Icon(
                        Icons.visibility,
                        size: 28,
                      )
                    : Icon(
                        Icons.visibility_off,
                        size: 28,
                      ),
                onTap: () {
                  sifre = !sifre;
                  setState(() {});
                },
              ),
              Image.asset(
                'assets/pictures/gender.png',
                width: 23,
              ),
              Icon(
                Icons.calendar_month_outlined,
                size: 28,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                u.kullanici_adi,
                style: Texts.profileDetayTextStyle,
              ),
              Text(
                sifre ? u.sifre : '*' * u.sifre.length,
                style: Texts.profileDetayTextStyle,
              ),
              Text(
                u.cinsiyet,
                style: Texts.profileDetayTextStyle,
              ),
              Text(
                takvimDuzenle(u.kayit_tarihi),
                style: Texts.profileDetayTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String takvimDuzenle(DateTime d) {
    String metin = "";

    metin = d.toString().substring(8, 10).toString();
    metin += '-' + d.toString().substring(5, 7).toString();
    metin += '-' + d.toString().substring(0, 4).toString();

    return metin;
  }
}
