import 'package:flutter/material.dart';
import 'package:task/controllers/fav_movies_controller.dart';
import 'package:task/models/movie.dart';
import 'package:task/services/api_error.dart';
import 'package:task/services/movie_service.dart';
import 'package:task/widgets/error_item.dart';
import 'package:task/widgets/movie_item.dart';
import 'package:task/widgets/responsive_grid.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<List<Movie>> moviesList;
  final api = MovieService();

  @override
  void initState() {
    super.initState();

    moviesList = getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorItem(
              errorMessage: snapshot.error.toString(),
              onRetryPressed: () {
                moviesList = getMovies();
                setState(() {});
              },
            ),
          );
        } else {
          return ResponsiveGridItem(
            data: snapshot.data!,
            itemBuilder: (context, index) {
              final movie = snapshot.data![index];
              return MovieItem(
                movie: movie,
                movieController: FavMovieController(),
              );
            },
          );
        }
      },
    );
  }

  Future<List<Movie>> getMovies() async {
    try {
      final response = await api.getMovies();
      return response.movies;
    } catch (e) {
      throw ApiError.withDioError(e);
    }
  }
}
