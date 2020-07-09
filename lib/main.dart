import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindermovies/pages/wraper.dart';
import 'package:tindermovies/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Tinder Movies App',
        home: Wraper(),

        theme: ThemeData(
          primaryColor: Color(0xFF1E3044),
          primaryColorDark: Color(0xFF1C2329),
          primaryColorLight: Color(0xFF1E3044),
          accentColor: Color(0xFFFF6642),
          canvasColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 28,
            ),
            bodyText2: TextStyle(
              fontSize: 18,
              color: Colors.grey
            ),
          ),
        ),
      ),
    );
  }
}
