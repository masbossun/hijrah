import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hijrah/models/index.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    Key key,
    this.surah,
  }) : super(key: key);

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Quran/Detail', arguments: surah);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 124,
                  child: Text(
                    surah.asma,
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${surah.nomor}. ${surah.nama}",
                      style: Theme.of(context).textTheme.display2,
                    ),
                    Text(
                      surah.arti,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(FeatherIcons.chevronRight),
              onPressed: () {
                Navigator.pushNamed(context, '/Quran/Detail');
              },
            )
          ],
        ),
      ),
    );
  }
}
