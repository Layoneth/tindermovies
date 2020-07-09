import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tindermovies/pages/home/tinder_page.dart';
import 'package:tindermovies/services/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  final GlobalKey _bottomNavigationKey = GlobalKey();
  final bodies = [
    TinderPage(),
    Container(),
    Container(),
  ];
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Sing out',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => _auth.singOut(),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColorLight,
        child: Center(
          child: bodies[_page]
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.trending_down,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: Theme.of(context).primaryColorDark,
        buttonBackgroundColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColorLight,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
