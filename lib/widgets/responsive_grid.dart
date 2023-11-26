import 'package:flutter/material.dart';
import 'package:task/models/movie.dart';

/// The [ResponsiveGridItem] widget creates a responsive grid based on the screen width.

class ResponsiveGridItem extends StatelessWidget {
  const ResponsiveGridItem({
    Key? key,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);

  final List<Movie> data;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        late int gridCount;
        if (width <= 480) {
          gridCount = 2;
        } else if (width > 480 && width <= 960) {
          gridCount = 3;
        } else if (width > 700 && width <= 900) {
          gridCount = 4;
        } else {
          gridCount = 4;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1 / 1.4,
            ),
            itemCount: data.length,
            itemBuilder: itemBuilder,
          ),
        );
      },
    );
  }
}
