import 'package:flutter/material.dart';
import 'package:kitap_tanitim_app/constants/constants.dart';
import 'package:kitap_tanitim_app/constants/renkler.dart';
import 'package:kitap_tanitim_app/constants/texts.dart';
import 'package:kitap_tanitim_app/models/kitapDetay.dart';

class BookDetailProperty extends StatelessWidget {
  final KitapDetay kd;
  final List<KitapDetay> kitap;
  const BookDetailProperty({required this.kd, required this.kitap, super.key});

  @override
  Widget build(BuildContext context) {
    int l = kitap.length;

    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          kd.kitap_adi,
          style: Texts.bookDetailBookNameTextStyle,
        ),
        Text(
          kd.yazar_adi + ' ' + kd.yazar_soyadi,
          style: Texts.bookDetailYazarNameTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < kd.puan; i++)
                Row(
                  children: [
                    Image.asset(
                      'assets/pictures/star.png',
                      width: 14,
                      height: 14,
                    ),
                    i != kd.puan - 1
                        ? SizedBox(
                            width: 8,
                          )
                        : SizedBox()
                  ],
                ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              height: 60,
              child: Column(
                children: [
                  Text(kd.sayfa_sayisi.toString(),
                      style: Texts.bookDetailBookDetail),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Sayfa", style: Texts.bookDetailBookDetailGrey)
                ],
              ),
            ),
            Container(
              height: 60,
              width: 2,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(1)),
            ),
            Container(
              width: 150,
              height: 60,
              child: Column(
                children: [
                  Text(kd.kategori_adi!, style: Texts.bookDetailBookDetail),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Kategori", style: Texts.bookDetailBookDetailGrey)
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: Constants.bookDetailPadding,
          width: double.infinity,
          child: Padding(
            padding: Constants.kitapAciklamaPadding,
            child: Text(
              kd.aciklama,
              style: Texts.bookDetailTextStyle,
            ),
          ),
        ),
        Divider(thickness: 2),
        SizedBox(
          height: 10,
        ),
        Text(
          "Kitap Hakkında Diğer Bilgiler",
          style: Texts.bookDetailTextStyleBold300,
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          indent: 80,
          endIndent: 80,
        ),
        Container(
          margin: Constants.standartPadding,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: Constants.kitapAciklamaPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kd.film_adi != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Film Adı: " + kd.film_adi!,
                              style: Texts.bookDetailTextStyleBold300),
                          Text("Film Kategorisi: " + kd.kategori!,
                              style: Texts.bookDetailTextStyleBold300),
                          Text("Film Yönetmeni: " + kd.yonetmen_adi!,
                              style: Texts.bookDetailTextStyleBold300),
                          Text("Film Yayın Yılı: " + kd.yayin_yili.toString(),
                              style: Texts.bookDetailTextStyleBold300),
                        ],
                      )
                    : Text("Bu kitabın bir filmi bulunmamaktadır.",
                        style: Texts.bookDetailTextStyleBold300),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yazar: " + kd.yazar_adi + ' ' + kd.yazar_soyadi,
                        style: Texts.bookDetailTextStyleBold300),
                    Text(
                        "Yazar Doğum Tarihi: " + takvimDuzenle(kd.dogum_tarihi),
                        style: Texts.bookDetailTextStyleBold300)
                  ],
                ),
                Divider(),
                kd.site_adi != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Kitabın PDF olarak bulunduğu site: " +
                                  kd.site_adi!,
                              style: Texts.bookDetailTextStyleBold300),
                          Text("Kitabın PDF ücreti: " + kd.ucret.toString(),
                              style: Texts.bookDetailTextStyleBold300),
                        ],
                      )
                    : Column(
                        children: [
                          Text("Kitabın PDF olarak bulunduğu bir site yoktur.",
                              style: Texts.bookDetailTextStyleBold300)
                        ],
                      ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yayınevi adı: " + kd.yayinevi_adi,
                      style: Texts.bookDetailTextStyleBold300,
                    ),
                    Text("Yayınevi adresi: " + kd.adres,
                        style: Texts.bookDetailTextStyleBold300),
                  ],
                ),
                Divider(),
                Column(
                  children: [
                    Text(
                      "Kitabın bulunduğu kütüphaneler ve adresleri:\n" +
                          kutuphaneler(),
                      style: Texts.bookDetailTextStyleBold300,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String takvimDuzenle(DateTime d) {
    String metin = "";

    metin = d.toString().substring(8, 10).toString();
    metin += '-' + d.toString().substring(5, 7).toString();
    metin += '-' + d.toString().substring(0, 4).toString();

    return metin;
  }

  String kutuphaneler() {
    String kutup = "";

    for (var k in kitap) {
      kutup += k.kutuphane_adi + ' | ';
      kutup += k.kutuphane_adres + '.\n';
    }

    return kutup;
  }
}
