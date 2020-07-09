class Peliculas {
  List<Pelicula> pelis = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> json) {
    if (json == null) return;

    for (var item in json) {
      final pelicula = Pelicula.fromJson(item);
      pelis.add(pelicula);
    }
  }
}

class Pelicula {
  double _popularity;
  int _voteCount;
  String _posterPath;
  int _id;
  String _backdropPath;
  String _originalLanguage;
  String _originalTitle;
  String _title;
  double _voteAverage;
  String _overview;
  String _releaseDate;

  Pelicula(
      {double popularity,
      int voteCount,
      String posterPath,
      int id,
      String backdropPath,
      String originalLanguage,
      String originalTitle,
      String title,
      double voteAverage,
      String overview,
      String releaseDate}) {
    this._popularity = popularity;
    this._voteCount = voteCount;
    this._posterPath = posterPath;
    this._id = id;
    this._backdropPath = backdropPath;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    this._title = title;
    this._voteAverage = voteAverage;
    this._overview = overview;
    this._releaseDate = releaseDate;
  }

  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;
  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  int get id => _id;
  set id(int id) => _id = id;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  String get originalTitle => _originalTitle;
  set originalTitle(String originalTitle) => _originalTitle = originalTitle;
  String get title => _title;
  set title(String title) => _title = title;
  double get voteAverage => _voteAverage;
  set voteAverage(double voteAverage) => _voteAverage = voteAverage;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  String get releaseDate => _releaseDate;
  set releaseDate(String releaseDate) => _releaseDate = releaseDate;

  Pelicula.fromJson(Map<String, dynamic> json) {
    _popularity = json['popularity'] / 1;
    _posterPath = json['poster_path'];
    _id = json['id'];
    _backdropPath = json['backdrop_path'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _title = json['title'];
    _voteAverage = json['vote_average'] / 1;
    _overview = json['overview'];
    _releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this._popularity;
    data['vote_count'] = this._voteCount;
    data['poster_path'] = this._posterPath;
    data['id'] = this._id;
    data['backdrop_path'] = this._backdropPath;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['title'] = this._title;
    data['vote_average'] = this._voteAverage;
    data['overview'] = this._overview;
    data['release_date'] = this._releaseDate;
    return data;
  }
}
