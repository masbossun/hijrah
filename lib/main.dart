import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(249, 249, 250, 1.0),
        systemNavigationBarColor: Color.fromRGBO(249, 249, 250, 1.0)),
  );
  await DotEnv().load('.env');
  Routes();
}
