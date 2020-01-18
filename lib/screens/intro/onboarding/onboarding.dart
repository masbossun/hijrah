import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: Text('SPlash Screen',
              style: Theme.of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.black)),
        ),
      ),
    );
  }
}
