import 'package:flutter/material.dart';
import 'package:tindermovies/providers/peliculas_provider.dart';
import 'package:tindermovies/services/auth.dart';
import 'package:tindermovies/widgets/card_swiper.dart';
import 'package:tindermovies/widgets/loading.dart';

class TinderPage extends StatelessWidget {
  final peliculasProv = PeliculasProvider();
  final _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FutureBuilder<List>(
          future: peliculasProv.getPeliculas(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) 
            return Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: Center(
                child: LoadingWidget()
              ),
            );
            return CardSwiper(
              movies: snapshot.data,
            );
          }
        ),
      ],
    );
  }
}
