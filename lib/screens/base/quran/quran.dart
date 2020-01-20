import 'package:flutter/material.dart';
import 'package:hijrah/models/index.dart';
import 'package:hijrah/screens/base/quran/widgets/featured_surah_card.dart';
import 'package:hijrah/screens/base/quran/widgets/sort_button.dart';
import 'package:hijrah/screens/base/quran/widgets/surah_list_item.dart';
import 'package:hijrah/utils/fetch.dart';
import 'package:hijrah/widgets/topbar.dart';
import 'package:rive/rive.dart';

class Quran extends StatefulWidget {
  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<Surah> _surah = List<Surah>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loading = true;
    _getSurahs();
  }

  void _getSurahs() async {
    List<Surah> surah = await Webservice().load(Surah.all);

    setState(() {
      _surah = surah;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        iconButton: IconButton(
          icon: const SortButton(),
          onPressed: () {},
        ),
        title: 'QURAN',
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 16),
        child: SafeArea(
          child: ListView.builder(
            itemCount: loading ? 2 : _surah.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: FeaturedSurah(),
                );
              }
              index -= 1;
              return Container(
                child: loading
                    ? Container(
                        height: 400,
                        width: 200,
                        child: Rive(
                          filename: 'assets/animations/loading.flr',
                          animation: 'Artboard',
                        ),
                      )
                    : SurahItem(surah: _surah[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
