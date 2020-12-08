import 'package:flutter/material.dart';
import '../ui//movie_detail.dart';
import '../bloc/movie_bloc.dart';
import '../model/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    movieBloc.fetctAllMovies();
  }

  @override
  void dispose() {
    movieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    movieBloc.fetctAllMovies();
    return Scaffold(
      appBar: AppBar(
        title:  Text("Popular Movies"),
      ),
      body: StreamBuilder(
        stream: movieBloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if(snapshot.hasData) {
            return buildList(snapshot);
          } else {
            Text(snapshot.error.toString());
          }

          return Center(child: CircularProgressIndicator());
        }
      
      )
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {

  return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index) {

        return GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${snapshot.data
                    .results[index].posterPath}',
                fit: BoxFit.cover,
              ),
              onTap: () => openDetailPage(snapshot.data, index),
            ),
          );
      }
    );
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      print(data.results[index].posterPath);
      return MovieDetail(
        title: data.results[index].title ?? 'Empty Title',
        description: data.results[index].overview ?? '',
        movieId: data.results[index].id,
        posterUrl: data.results[index].posterPath,
        releaseDate: data.results[index].releaseDate,
        voteAverage: data.results[index].voteAverage.toString() ?? '0',
      );
    }));
  }
}

 