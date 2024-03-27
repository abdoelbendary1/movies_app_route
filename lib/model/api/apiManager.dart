import 'dart:convert';

import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:http/http.dart' as http;

/* https://api.themoviedb.org/3/movie/popular?api_key=5a941d4b4f72eb0bfdf088082292c0a1 */

class ApiManager {
  static Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(Constants.popualrUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(Constants.popualrUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }

  static Future<List<Movie>> getTopRated() async {
    final response = await http.get(Uri.parse(Constants.topRatedUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["results"] as List;

      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw "something wrong happened";
    }
  }
}
