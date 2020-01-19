import 'package:flutter/material.dart';
import 'package:hijrah/models/index.dart';
import 'package:hijrah/screens/base/quran/widgets/featured_surah_card.dart';
import 'package:hijrah/screens/base/quran/widgets/sort_button.dart';
import 'package:hijrah/screens/base/quran/widgets/surah_list_item.dart';
import 'package:hijrah/utils/fetch.dart';
import 'package:hijrah/widgets/topbar.dart';

class Quran extends StatefulWidget {
  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<Surah> _surah = List<Surah>();

  @override
  void initState() {
    super.initState();
    _getSurahs();
  }

  void _getSurahs() async {
    List<Surah> surah = await Webservice().load(Surah.all);

    setState(() {
      _surah = surah;
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
            itemCount: _surah.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: FeaturedSurah(),
                );
              }
              index -= 1;
              return SurahItem(surah: _surah[index]);
            },
          ),
        ),
      ),
    );
  }
}
