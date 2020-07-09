import 'package:flutter/material.dart';
import 'package:tindermovies/providers/peliculas_provider.dart';
import 'package:tindermovies/services/auth.dart';

class TinderPage extends StatelessWidget {
  final peliculasProv = PeliculasProvider();
  final _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    
    peliculasProv.getPeliculas();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Tinder'),
          FlatButton(onPressed: () => _auth.singOut(), child: Text('Sing out'))
        ],
      )
    );
  }
}
