import 'dart:async';
import 'dart:io';
import 'package:BlocPatterLearning/src/model/trailer_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../model/item_model.dart';

class MovieApiProvider {
  final String _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Client client = Client();
  
  Future<ItemModel> fetchAllMovies() async {
    print("fetchMovieList");

    final resp = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

    if(resp.statusCode == HttpStatus.ok) {
      return ItemModel.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception("Failed to laod movie");
    }
  }

  Future<TrailerModel> fetchTrailerMovie(int movieId) async {
    print("Fetching Trialer for movie $movieId" );

    final resp = await client.get('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$_apiKey');

    if(resp.statusCode == HttpStatus.ok) {
      return TrailerModel.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Unable to get movie trailers');
    }

  }
}