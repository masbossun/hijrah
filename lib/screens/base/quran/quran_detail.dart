import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hijrah/models/index.dart';
import 'package:hijrah/utils/fetch.dart';
import 'package:hijrah/widgets/styled_underline.dart';
import 'package:hijrah/widgets/topbar.dart';

class QuranDetail extends StatefulWidget {
  @override
  _QuranDetailState createState() => _QuranDetailState();
}

class _QuranDetailState extends State<QuranDetail>
    with AfterInitMixin<QuranDetail> {
  Surah _surah;
  List<Ayat> _ayat;
  bool loading = false;

  @override
  void didInitState() {
    setState(() {
      _surah = ModalRoute.of(context).settings.arguments;
      loading = true;
    });
    _getAllAyat(int.parse(_surah.nomor));
  }

  void _getAllAyat(int surahNumber) async {
    List<Ayat> ayat = await Webservice().load(Ayat.get(surahNumber));
    setState(() {
      _ayat = ayat;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        title: null,
      ),
      body: loading
          ? Container(
              child: Text("Loading..."),
            )
          : ListView.builder(
              itemCount: _ayat.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SurahInfo(surah: _surah);
                }
                index -= 1;

                return AyahItem(
                    ayat: _ayat[index], cropBismillah: _surah.nomor != "1");
              },
            ),
    );
  }
}

class SurahInfo extends StatelessWidget {
  const SurahInfo({Key key, @required this.surah}) : super(key: key);

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            margin: const EdgeInsets.only(bottom: 8),
            child: QuranDetailHeader(
              surahName: surah.nama,
              surahNameMeaning: surah.arti,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: QuranDetailInfo(
              ayah: surah.ayat,
              type: surah.type,
              order: surah.urut,
              ruku: surah.rukuk,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: QuranDescription(description: surah.keterangan),
          ),
        ],
      ),
    );
  }
}

class AyahItem extends StatelessWidget {
  const AyahItem({
    Key key,
    this.ayat,
    this.cropBismillah,
  }) : super(key: key);

  final Ayat ayat;
  final bool cropBismillah;

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
              ayat.nomor,
              style: Theme.of(context).textTheme.display2,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32),
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              ayat.nomor == "1" && cropBismillah
                  ? ayat.ar.substring(38, ayat.ar.length)
                  : ayat.ar,
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            alignment: Alignment(1, 0),
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Html(
              data: ayat.id,
              defaultTextStyle: Theme.of(context).textTheme.body1,
              customTextAlign: (dynamic any) {
                return TextAlign.end;
              },
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
        Html(
          data: description,
          defaultTextStyle: Theme.of(context).textTheme.body1,
        )
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
  final String order;
  final String ruku;
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
