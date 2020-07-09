import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tindermovies/models/pelicula.dart';

class PeliculasProvider {
  String _apiKey = 'b77df74376b54304a5a8a160a5e489fa';
  String _url = 'api.themoviedb.org';
  String _lang = 'es-ES';

  Future<List<Pelicula>> getPeliculas() async {
    try {
      final url = Uri.https(_url, '/3/movie/now_playing',
          {'api_key': _apiKey, 'language': _lang});

      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      final peliculas = Peliculas.fromJsonList(decodedData['results']);
      return peliculas.pelis;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
