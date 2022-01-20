import 'package:flutter/material.dart';

import 'movies_page.dart';
import 'favorites_page.dart';

class Body extends StatelessWidget {
  const Body(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return index == 0 ? const MoviesPage() : const FavoritesPage();
  }
}
