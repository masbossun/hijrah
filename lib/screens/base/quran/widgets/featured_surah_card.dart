import 'package:flutter/material.dart';

class FeaturedSurah extends StatelessWidget {
  const FeaturedSurah({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(2.0, 2.0),
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [-1, 0.9],
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              'Lanjutkan Membaca',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .copyWith(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Surah Al Baqarah',
                    style: Theme.of(context).textTheme.display3,
                  ),
                  Text(
                    'Ayat 183',
                    style: Theme.of(context).textTheme.display3,
                  ),
                ],
              ),
              Text(
                '...يَا أَيُّهَا الَّذِينَ آمَنُوا',
                style: Theme.of(context).textTheme.display1,
                textAlign: TextAlign.end,
              )
            ],
          ),
        ],
      ),
    );
  }
}
