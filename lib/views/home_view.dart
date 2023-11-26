import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/views/fav_movies.dart';
import 'package:task/widgets/movie_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          actions: [
            IconButton(
                onPressed: () {

                  Get.to(FavMoviesView());
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: const MovieList());
  }
}
