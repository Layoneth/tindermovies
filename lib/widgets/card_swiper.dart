import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tindermovies/models/pelicula.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> movies;
  const CardSwiper({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            fit: BoxFit.fill,
            placeholder: NetworkImage(
              "http://via.placeholder.com/288x188",
            ),
            image: NetworkImage(
              movies.elementAt(index).posterPath,
            ),
          ),
        );
      },
      itemCount: movies.length,
      itemWidth: MediaQuery.of(context).size.width - 50,
      itemHeight: MediaQuery.of(context).size.height * 0.65,
      layout: SwiperLayout.TINDER,
    );
  }
}
