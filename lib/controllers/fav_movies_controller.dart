import 'package:get/get.dart';
import 'package:task/base/app_data.dart';
import 'package:task/models/movie.dart';

class FavMovieController extends GetxController {
  Movie? movie;
  var favMovies = <Movie>[].obs;

  RxBool isFavMovie = false.obs;

  void isFav(Movie movie) {
    final movieResponse = AppData.instance.findExistingItem(movie);
    if (movieResponse != null) {
      isFavMovie.value = true;
    } else {
      isFavMovie.value = false;
    }
  }

  Future<void> addToFav(Movie movie) async {
    await AppData.instance.addFavMovieToLocalDb(movie);
  }

  getFavMovies() {
    favMovies.value = AppData.instance.movies;
    print(favMovies.value.length);
  }
}
