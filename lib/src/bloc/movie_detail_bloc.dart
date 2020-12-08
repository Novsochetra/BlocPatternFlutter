
import 'package:BlocPatterLearning/src/model/trailer_model.dart';
import 'package:BlocPatterLearning/src/resource/movie_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class MovieDetailBloc {
  final _repository = MovieRepository();
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<TrailerModel>>();

  Function(int) get fetchTrailersById => _movieId.sink.add;

  Stream<Future<TrailerModel>> get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer((Future<TrailerModel> trailer, int id, int index) {
        print(index) ;
        trailer = _repository.fetchTrailers(id);
        return trailer;
      }
    );
  }
}