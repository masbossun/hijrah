import 'package:flutter/material.dart';
import 'package:hijrah/screens/base/quran/widgets/featured_surah_card.dart';
import 'package:hijrah/screens/base/quran/widgets/sort_button.dart';
import 'package:hijrah/screens/base/quran/widgets/surah_list_item.dart';
import 'package:hijrah/widgets/topbar.dart';

class Quran extends StatelessWidget {
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
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: FeaturedSurah(),
              ),
              SurahItem(),
              SurahItem(),
              SurahItem(),
              SurahItem(),
              SurahItem(),
              SurahItem(),
              SurahItem(),
              SurahItem(),
            ],
          ),
        ),
      ),
    );
  }
}
