import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hijrah/screens/base/more/more.dart';
import 'package:hijrah/screens/base/quran/index.dart';
import 'package:hijrah/screens/base/search/search.dart';

class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  final List<Widget> _children = <Widget>[
    Quran(),
    Search(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.bookOpen),
            title: Text('Surah'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.search),
            title: Text('Cari'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.moreHorizontal),
            title: Text('Lainnya'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
