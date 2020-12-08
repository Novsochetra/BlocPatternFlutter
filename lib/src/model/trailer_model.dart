
class TrailerModel {
  int _id;
  List<_Result> _results = [];

  TrailerModel.fromJson(Map<String, dynamic> parsedJson)   {
    _id = parsedJson['id'];
    List<_Result> tmp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      tmp.add(_Result(parsedJson['results'][i]));
    }

    _results = tmp;
  }

  int get id => _id;

  List<_Result> get results => _results;
}

class _Result {
  int _size;
  

  String _id;
  String _iso6391;
  String _iso31661;
  String _key;
  String _name;
  String _site;
  String _type;

  _Result(result) {
    _id = result['id'];
    _iso6391 = result['iso_639_1'];
    _iso31661 = result['iso_3166_1'];
    _key = result['key'];
    _name = result['name'];
    _site = result['site'];
    _type = result['type'];
  }

  
  String get id => _id;

  String get iso6391 => _iso6391;

  String get iso31661 =>  _iso31661;

  String get key => _key;

  String get name => _name;

  String get site => _site;

  String get type => _type; 

  int get size => _size;
}