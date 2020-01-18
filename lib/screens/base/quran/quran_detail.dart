import 'package:flutter/material.dart';
import 'package:hijrah/widgets/styled_underline.dart';
import 'package:hijrah/widgets/topbar.dart';

class QuranDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        title: null,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: QuranDetailHeader(
                    surahName: 'Al Fatihah',
                    surahNameMeaning: 'Pembukaan',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  child: QuranDetailInfo(
                      ayah: 7, type: 'Mekah', order: 5, ruku: 1),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: QuranDescription(
                    description:
                        '''Surat Al Faatihah (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut Al Faatihah (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan Ummul Quran (induk Al Quran) atau Ummul Kitaab (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang.
Dinamakan pula As Sab'ul matsaany (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.''',
                  ),
                ),
              ],
            ),
          ),
          AyahItem(),
          AyahItem(),
          AyahItem(),
          AyahItem(),
        ],
      ),
    );
  }
}

class AyahItem extends StatelessWidget {
  const AyahItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
              color: Theme.of(context).accentColor,
            ),
            padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Text(
              '1',
              style: Theme.of(context).textTheme.display2,
            ),
          ),
          Container(
            alignment: Alignment(1, 0),
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.only(bottom: 16),
            child: Text(
              'بِسۡمِ ٱللهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِيمِ',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            alignment: Alignment(1, 0),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Dengan menyebut nama Allah yang maha pengasih lagi maha penyayang',
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}

class QuranDescription extends StatelessWidget {
  const QuranDescription({Key key, @required this.description})
      : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Keterangan',
          style: Theme.of(context).textTheme.display2,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.body1,
        ),
      ],
    );
  }
}

class QuranDetailInfo extends StatelessWidget {
  const QuranDetailInfo({
    Key key,
    @required this.ayah,
    @required this.order,
    @required this.ruku,
    @required this.type,
  }) : super(key: key);

  final int ayah;
  final int order;
  final int ruku;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        QuranDetailInfoItem(
          title: 'Ayat',
          value: ayah.toString(),
        ),
        QuranDetailInfoItem(
          title: 'Jenis',
          value: type,
        ),
        QuranDetailInfoItem(
          title: 'Urutan',
          value: order.toString(),
        ),
        QuranDetailInfoItem(
          title: "Ruku'",
          value: ruku.toString(),
        ),
      ],
    );
  }
}

class QuranDetailInfoItem extends StatelessWidget {
  const QuranDetailInfoItem({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 4),
          child: Text(
            value,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.display2,
        ),
      ],
    );
  }
}

class QuranDetailHeader extends StatelessWidget {
  const QuranDetailHeader(
      {Key key, @required this.surahName, @required this.surahNameMeaning})
      : super(key: key);

  final String surahName;
  final String surahNameMeaning;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          surahName,
          style: Theme.of(context).textTheme.display4,
        ),
        Stack(
          children: <Widget>[
            StyledUnderline(),
            Container(
              child: Text(
                surahNameMeaning,
                style: Theme.of(context).textTheme.body2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
