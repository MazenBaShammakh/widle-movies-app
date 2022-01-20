import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => [..._movies];

  Future<void> fetchMovies() async {
    final _url = Uri.parse('http://165.22.75.82/v1/movies');

    try {
      final movieResponse = await http.get(_url);
      final moviesData =
          json.decode(movieResponse.body) as Map<String, dynamic>;
      final moviesList = moviesData['data']['movies'] as List<dynamic>;
      for (int i = 0; i < moviesList.length; i++) {
        _movies.add(
          Movie(
            id: moviesList[i]['id'],
            name: moviesList[i]['name'],
            year: moviesList[i]['year'],
            director: moviesList[i]['director'],
            star: moviesList[i]['main_star'],
            description: moviesList[i]['description'],
            favoriteCounts: moviesList[i]['favorited_by_users'],
            genres: moviesList[i]['genres'],
            thumbnail: (moviesList[i]['thumbnail'] as String)
                .replaceAll('thumb/', 'medium/'),
          ),
        );
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
