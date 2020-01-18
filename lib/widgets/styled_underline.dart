import 'package:flutter/material.dart';

class StyledUnderline extends StatelessWidget {
  const StyledUnderline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      right: 0,
      bottom: 5,
      height: 5,
      child: Container(
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
