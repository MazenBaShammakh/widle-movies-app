import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widle_studio_practical_test/models/movie.dart';

import 'package:widle_studio_practical_test/providers/movies.dart';

import 'package:widle_studio_practical_test/constants.dart';

import 'section_title.dart';
import 'divider.dart';
import 'movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Provider.of<Movies>(context).movies;
    return Container(
      padding: const EdgeInsets.all(kSpacingUnit * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('all movies'),
          const SizedBox(height: kSpacingUnit),
          const CustomDivider(),
          const SizedBox(height: kSpacingUnit * 4),
          MoviesList(movies),
        ],
      ),
    );
  }
}
