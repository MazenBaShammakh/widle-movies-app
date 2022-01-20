import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widle_studio_practical_test/models/movie.dart';

import 'movie_card.dart';

class MoviesList extends StatelessWidget {
  const MoviesList(
    this.movies, {
    Key? key,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: movies
              .map(
                (movie) => ChangeNotifierProvider.value(
                  value: movie,
                  child: MovieCard(movie),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
