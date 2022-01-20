import 'package:flutter/material.dart';
import 'package:widle_studio_practical_test/constants.dart';

import 'package:widle_studio_practical_test/models/movie.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Container(
      padding: const EdgeInsets.all(kSpacingUnit * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: movie.id,
                child: Container(
                  height: 200,
                  child: Image.network(movie.thumbnail),
                ),
              ),
              const SizedBox(width: kSpacingUnit * 2),
              Expanded(
                child: Text(
                  movie.name,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // const Spacer(),
          const SizedBox(height: kSpacingUnit * 4),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(kSpacingUnit * 4),
              decoration: BoxDecoration(
                color: kNeutralGrey,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: kNeutralDark.withOpacity(.2),
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(kSpacingUnit * 4),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // const Text(
                    //   'Details',
                    //   style: TextStyle(
                    //     fontSize: 32,
                    //     color: kNeutralDark,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: kSpacingUnit * 2),
                    if (movie.description.isNotEmpty) ...[
                      movieDetail('Description', movie.description),
                      const SizedBox(height: kSpacingUnit * 2),
                    ],
                    if (movie.year.isNotEmpty) ...[
                      movieDetail('Year', movie.year),
                      const SizedBox(height: kSpacingUnit * 2),
                    ],
                    if (movie.star.isNotEmpty) ...[
                      movieDetail('Main Star', movie.star),
                      const SizedBox(height: kSpacingUnit * 2),
                    ],
                    if (movie.director.isNotEmpty) ...[
                      movieDetail('Director', movie.director),
                      const SizedBox(height: kSpacingUnit * 2),
                    ],
                    ...[
                      movieDetail('Favorited by users',
                          movie.favoriteCounts.toString()),
                      const SizedBox(height: kSpacingUnit * 2),
                    ],
                    movieGenres('Genres', movie.genres)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox movieDetail(String title, String description) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: kPrimaryColor.withOpacity(.7),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: kSpacingUnit / 2),
          Text(
            description,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox movieGenres(String title, List<dynamic> genres) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: kPrimaryColor.withOpacity(.7),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: kSpacingUnit / 2),
          ...genres
              .map(
                (genre) => Text(
                  genre,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
