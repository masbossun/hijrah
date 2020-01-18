import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'package:hijrah/screens/intro/splash/index.dart';
import 'package:hijrah/screens/intro/onboarding/index.dart';
import 'package:hijrah/screens/base/quran/index.dart';
import 'package:hijrah/screens/base/base.dart';
import 'package:hijrah/screens/base/more/more.dart';

class Routes {
  Routes() {
    runApp(BaseApp());
  }
}

class BaseApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    '/Splash': (BuildContext context) => Splash(),
    '/Onboarding': (BuildContext context) => Onboarding(),
    '/Quran': (BuildContext context) => Quran(),
    '/Quran/Detail': (BuildContext context) => QuranDetail(),
    '/More': (BuildContext context) => More(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'waruung',
      routes: routes,
      home: Base(),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(103, 185, 156, 1.0),
        accentColor: const Color.fromRGBO(147, 249, 185, 1.0),
        backgroundColor: const Color.fromRGBO(249, 249, 250, 1.0),
        textTheme: GoogleFonts.firaSansTextTheme().copyWith(
          headline: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            color: Colors.black,
          ),
          display1: GoogleFonts.amiri(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          display2: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          display3: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          display4: GoogleFonts.nunito(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          body1: GoogleFonts.firaSans(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
            height: 1.8,
          ),
          body2: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
