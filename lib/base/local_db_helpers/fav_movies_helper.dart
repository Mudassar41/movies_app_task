part of '../app_data.dart';

/// The [FavMoviesHelper] mixin provides methods for interacting with the local database
/// to manage favorite movies.

mixin FavMoviesHelper {
  late Box<Movie> _movieBox;

  Future<void> initFavMoviesBox() async {
    _movieBox = await Hive.openBox<Movie>('fav-movies');
  }

  Future<void> addFavMovieToLocalDb(Movie movie) async {
    final existingMovie = findExistingItem(movie);

    if (existingMovie != null) {
      final key = existingMovie.key;
      await _movieBox.delete(key);
    } else {
      await _movieBox.add(movie);
      await movie.save();
    }
  }

  List<Movie> get movies => _movieBox.values.toList();

  Movie? findExistingItem(Movie newItem) {
    final analytics = _movieBox.values.where((item) => item.id == newItem.id);

    if (analytics.isEmpty) {
      return null;
    }
    return analytics.first;
  }
}
