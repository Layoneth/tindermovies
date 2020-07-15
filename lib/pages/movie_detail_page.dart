import 'package:flutter/material.dart';
import 'package:tindermovies/models/pelicula.dart';

class MovieProfilePage extends StatelessWidget {
  final Pelicula pelicula;
  const MovieProfilePage({Key key, @required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(),
          _sliverListBody(),
        ],
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 5.0,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(pelicula.title),
        background: FadeInImage(
            placeholder: NetworkImage("http://via.placeholder.com/288x188"),
            image: NetworkImage(pelicula.backdropPath),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _sliverListBody() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _miniInformation(), 
            SizedBox(height: 8.0,),
            Text(pelicula.overview)
          ],
        ),
      )
    ]));
  }

  Widget _miniInformation() {
    return Row(
      children: <Widget>[
        Hero(
          tag: pelicula.title,
          child: Container(
            height: 230,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: NetworkImage(pelicula.posterPath), 
                image: NetworkImage(pelicula.posterPath),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Icon(Icons.star_border),
              Text(pelicula.voteAverage.toString())
            ],),
            Row(children: <Widget>[
              Icon(Icons.trending_up),
              Text(pelicula.popularity.toString())
            ],)
          ],
        )
      ],
    );
  }
}
