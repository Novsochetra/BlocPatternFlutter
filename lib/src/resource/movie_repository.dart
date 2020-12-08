
import 'package:BlocPatterLearning/src/model/item_model.dart';
import 'package:BlocPatterLearning/src/model/trailer_model.dart';
import 'package:BlocPatterLearning/src/resource/movie_api_provider.dart';

class MovieRepository {
  final MovieApiProvider movieApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchAllMovies();

  Future<TrailerModel> fetchTrailers(int movieId) => movieApiProvider.fetchTrailerMovie(movieId);
}