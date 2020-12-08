import 'package:rxdart/rxdart.dart';
import '../model/item_model.dart';
import '../resource/movie_repository.dart';

class MovieBloc {
  final _repository = MovieRepository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  fetctAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);

  }


  dispose() {
    _moviesFetcher.close();
  }
}

final movieBloc = MovieBloc();
