import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widle_studio_practical_test/models/movie.dart';

import 'package:widle_studio_practical_test/providers/auth.dart';

import 'package:widle_studio_practical_test/screens/movie/movie_screen.dart';

import 'package:widle_studio_practical_test/constants.dart';

class MovieCard extends StatefulWidget {
  const MovieCard(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  void initState() {
    // String username =
    //     Provider.of<Auth>(context, listen: false).username as String;
    // Provider.of<Movie>(context, listen: false).fetchFavorite(username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = Provider.of<Movie>(context).isFavorite ?? false;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          MovieScreen.routeName,
          arguments: widget.movie,
        );
      },
      child: Container(
        height: 148,
        padding: const EdgeInsets.symmetric(
          vertical: kSpacingUnit,
        ),
        child: Row(
          children: [
            Hero(
              tag: widget.movie.id,
              child: LayoutBuilder(
                builder: (_, constraints) => Container(
                  height: constraints.maxHeight,
                  width: constraints.maxHeight,
                  decoration: widget.movie.thumbnail.isNotEmpty
                      ? null
                      : BoxDecoration(
                          color: Colors.grey.shade400,
                        ),
                  child: widget.movie.thumbnail.isNotEmpty
                      ? Image.network(
                          widget.movie.thumbnail,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(width: kSpacingUnit * 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: kSpacingUnit),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.movie.name,
                      style: const TextStyle(
                        fontSize: 24,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: kSpacingUnit / 2),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.movie.year,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    icon: Icon(isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                    label: Text(
                      isFavorite ? 'Unfavorite' : 'Favorite',
                    ),
                    onPressed: () {
                      String username =
                          Provider.of<Auth>(context, listen: false).username
                              as String;
                      if (isFavorite) {
                        widget.movie.unfavoriteMovie(username);
                      } else {
                        widget.movie.favoriteMovie(username);
                      }
                    },
                  ),
                  const SizedBox(height: kSpacingUnit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
