import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Movie with ChangeNotifier {
  final int id;
  final String name;
  final List<dynamic> genres;
  final String year;
  final String thumbnail;
  final String director;
  final String star;
  final String description;
  final int favoriteCounts;
  bool? _isFavorite;

  bool? get isFavorite => _isFavorite;

  Movie({
    required this.id,
    required this.name,
    required this.genres,
    required this.year,
    required this.favoriteCounts,
    required this.description,
    required this.director,
    required this.star,
    required this.thumbnail,
  });

  Future<void> fetchFavorite(String username) async {
    final _url =
        Uri.parse('http://165.22.75.82/v1/movies/$id/users/$username/favorite');
    try {
      final response = await http.get(_url);
      print(response.body);
      // _isFavorite = json.decode(response.body)['isFavorite'] as bool;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> favoriteMovie(String username) async {
    final _url =
        Uri.parse('http://165.22.75.82/v1/movies/$id/users/$username/favorite');
    try {
      final response = await http.post(
        _url,
        body: json.encode({'isFavorite': true}),
      );
      print(response.body);
      _isFavorite = true;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> unfavoriteMovie(String username) async {
    final _url =
        Uri.parse('http://165.22.75.82/v1/movies/$id/users/$username/favorite');
    try {
      final response = await http.delete(_url);
      print(response.body);
      _isFavorite = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
