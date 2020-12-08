
class ItemModel {
  int _page;
  int _totalPages;
  int _totalResults;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalPages = parsedJson['total_pages'];
    _totalResults = parsedJson['total_results'];
    List<_Result> tmp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      print(parsedJson['results'][i]['original_title']);
      print("\n");
      
      _Result result = _Result(parsedJson['results'][i]);
      tmp.add(result);
    }

    _results = tmp;
  }

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}

class _Result {
  int _voteCount;
  int _id;

  double _popularity;
  double _voteAverage = 0.0;

  String _backdropPath;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  String _posterPath;
  String _releaseDate;
  String _title;

  bool _adult;
  bool _video;

  List<dynamic> _genreIds;

  _Result(result) {
    _backdropPath = result['backdrop_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    _overview = result['overview'];
    _posterPath = result['poster_path'];
    _releaseDate = result['release_date'];
    _title = result['title'];
    _voteCount = result['vote_count'];
    _id = result['id'];
    _popularity = result['popularity'];
    _voteAverage = result['vote_average'] + .0;
    _adult = result['adult'];
    _video = result['video'];
    _genreIds = result['genre_ids'] ;
  }

  String get releaseDate => _releaseDate;
  String get backdropPath => _backdropPath;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  String get posterPath => _posterPath;
  String get title => _title;

  int get voteCount => _voteCount;
  int get id => _id;

  double get popularity => _popularity.toDouble();
  double get voteAverage =>  _voteAverage;

  bool get adult => _adult;
  bool get video => _video;

  List<dynamic> get genreIds => _genreIds;
}