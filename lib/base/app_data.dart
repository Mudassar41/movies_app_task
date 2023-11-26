import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/models/movie.dart';

part 'local_db_helpers/fav_movies_helper.dart';

/// The [AppData] class is a singleton class responsible for managing application data,
/// including access to local databases and configuration settings.

class AppData with FavMoviesHelper {
  static final AppData _instance = AppData._();
  final _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MTIyMWNkMjg3MTRmNWFkNzU0ZjhiOWE2NjRkMzgwZCIsInN1YiI6IjY1NWQ5MDY3ZmFiM2ZhMDBhYjU4NDQ1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2vJGBGv8hi_UaL4nSzwf25N_XyGnR3f_TB2lxV-jD7A';

  AppData._();

  static AppData get instance => _instance;

  Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<Movie>(MovieAdapter());
    await initFavMoviesBox();
  }

  String get accessToken => _accessToken;
}
