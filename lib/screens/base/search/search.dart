import 'package:flutter/material.dart';
import 'package:hijrah/widgets/topbar.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        title: 'CARI',
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
