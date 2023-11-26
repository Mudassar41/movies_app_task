import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controllers/fav_movies_controller.dart';
import 'package:task/widgets/movie_item.dart';
import 'package:task/widgets/responsive_grid.dart';

class FavMoviesView extends StatelessWidget {
  FavMoviesView({Key? key}) : super(key: key);
  final favMoviesController = Get.put(FavMovieController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    favMoviesController.getFavMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourite Movies',
          style: textTheme.displayLarge!.copyWith(fontSize: 22),
        ),
      ),
      body: Obx(() {
        if (favMoviesController.favMovies.isEmpty) {
          return Center(
              child: Text(
            'No Items found',
            style: textTheme.displayMedium!.copyWith(fontSize: 18),
          ));
        }
        return ResponsiveGridItem(
          data: favMoviesController.favMovies,
          itemBuilder: (context, index) {
            final movie = favMoviesController.favMovies[index];
            return MovieItem(
              movie: movie,
              isFavView: true,
            );
          },
        );
      }),
    );
  }
}
