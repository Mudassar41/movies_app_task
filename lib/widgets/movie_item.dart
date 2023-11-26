import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/base/app_data.dart';
import 'package:task/controllers/fav_movies_controller.dart';
import 'package:task/models/movie.dart';
import 'package:task/utils/date_time_helper.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
    this.movieController,
    this.isFavView = false,
  }) : super(key: key);

  final Movie movie;
  final bool isFavView;
  final FavMovieController? movieController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (!isFavView) {
      movieController!.isFav(movie);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxHeight - 60;

        return Card(
          elevation: 2.0,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          maxLines: 1,

                          style: textTheme.displayLarge!.copyWith(
                            fontSize: 14,
                          ),

                        ),
                        Text(
                          'Release Date ${movie.releaseDate.toFormattedString}',
                          style: textTheme.displayMedium!.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (!isFavView)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Obx(
                    () {
                      return IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.black26),
                        onPressed: () async {
                          movieController!.isFavMovie.value =
                              !movieController!.isFavMovie.value;

                          await movieController!.addToFav(movie);
                        },
                        icon: Icon(
                          movieController!.isFavMovie.value
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          color: movieController!.isFavMovie.value
                              ? Colors.red
                              : Colors.white,
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
