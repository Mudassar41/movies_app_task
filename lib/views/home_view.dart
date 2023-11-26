import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/views/fav_movies.dart';
import 'package:task/widgets/movie_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Movies",
            style: textTheme.displayLarge!.copyWith(fontSize: 22),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(FavMoviesView());
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: const MovieList());
  }
}
