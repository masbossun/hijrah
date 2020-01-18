import 'package:flutter/material.dart';

class Topbar extends StatelessWidget implements PreferredSizeWidget {
  Topbar({this.title, this.iconButton});

  final String title;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        title: title != null
            ? Text(
                title,
                style: Theme.of(context).textTheme.headline,
              )
            : Container(),
        actions: <Widget>[iconButton != null ? iconButton : Container()],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(63.0);
}
