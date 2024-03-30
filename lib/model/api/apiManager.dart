import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/genre/genre.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app_route/model/dataModel/movie/movieDetails.dart';

/* https://api.themoviedb.org/3/movie/popular?api_key=5a941d4b4f72eb0bfdf088082292c0a1 */

class ApiManager {
  static Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(Constants.popualrUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      return [
        Movie(
            adult: false,
            backdropPath: "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
            genreIds: [28, 12, 16, 35, 10751],
            id: 1011985,
            originalLanguage: OriginalLanguage.EN,
            originalTitle: "Kung Fu Panda 4",
            overview:
                "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
            popularity: 4028.167,
            posterPath: "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
            releaseDate: DateTime.now(),
            title: "Kung Fu Panda 4",
            video: false,
            voteAverage: 6.938,
            voteCount: 379)
      ];
    }
  }

  /* static const _trendingURL =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }
 */
  static Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(Constants.upcomingUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  /*  static Future<MovieDetails> getMovieDetails(String movieID) async {
    final String apiKey = Constants
        .apiKey; // Replace 'YOUR_API_KEY' with your actual TMDb API key

    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieID?api_key=$apiKey"));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return MovieDetails.fromJson(json);
    } else {
      throw "Failed to fetch movie details";
    }
  } */

  static Future<MovieDetails?> fetchMovieDetails(String movieId) async {
    final apiKey = Constants
        .apiKey; // Replace 'YOUR_API_KEY' with your actual TMDb API key
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return MovieDetails.fromJson(jsonData);
      } else {
        // If the response status code is not 200, return null or throw an exception
        throw Exception('Failed to load movie details: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions during the HTTP request
      print('Error fetching movie details: $e');
      return null;
    }
  }

  static Future<MovieDetails> getMovieDetails(String movieId) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=${Constants.apiKey}');
    if (response.statusCode == 200) {
      return MovieDetails.fromJson(response.data);
    } else {
      throw "";
    }
  }

  static Future<MovieDetails> getMovieSimilar(String movieId) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${Constants.apiKey}');
    if (response.statusCode == 200) {
      return MovieDetails.fromJson(response.data);
    } else {
      throw "";
    }
  }

  static Future<List<Movie>> getSimilar(String movieId) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static Future<List<Movie>> getsearchedMovies() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=5a941d4b4f72eb0bfdf088082292c0a1"));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      return [
        Movie(
            adult: false,
            backdropPath: "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
            genreIds: [28, 12, 16, 35, 10751],
            id: 1011985,
            originalLanguage: OriginalLanguage.EN,
            originalTitle: "Kung Fu Panda 4",
            overview:
                "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
            popularity: 4028.167,
            posterPath: "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
            releaseDate: DateTime.now(),
            title: "Kung Fu Panda 4",
            video: false,
            voteAverage: 6.938,
            voteCount: 379)
      ];
    }
  }

  static Future<List<MovieDetails>> searchMovies(
      {required String query}) async {
    Uri url = Uri.https("api.themoviedb.org", "/3/search/movie", {
      "api_key": Constants.apiKey,
      "query": query,
    });

    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody)["results"] as List;
      return json.map((movie) => MovieDetails.fromJson(movie)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }
  /* final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  } */

/* https://api.themoviedb.org/3/search/movie?query=dora&include_adult=false&language=en-US&page=1&api_key=5a941d4b4f72eb0bfdf088082292c0a1 */
  static Future<List<Movie>> getTopRated() async {
    final response = await http.get(Uri.parse(Constants.topRatedUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static Future<List<Genres>> getGenres() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=5a941d4b4f72eb0bfdf088082292c0a1"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["genres"] as List;

      return json.map((genre) => Genres.fromJson(genre)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static Future<List<Movie>> getMoviesByGenre({required String genreId}) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/discover/movie?api_key=5a941d4b4f72eb0bfdf088082292c0a1&with_genres=${genreId}"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }
}
