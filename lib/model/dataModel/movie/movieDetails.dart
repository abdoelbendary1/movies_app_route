import 'package:movies_app_route/model/dataModel/movie/genre/genre.dart';

class MovieDetails {
  final String backdropPath;
  final List<Genres> genresList;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;

  const MovieDetails(
      {required this.backdropPath,
      required this.id,
      required this.genresList,
      required this.overView,
      required this.releaseDate,
      required this.runTime,
      required this.title,
      required this.voteAverage});

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      genresList: List<GenresModel>.from(
          json['genres'].map((e) => GenresModel.fromJson(e))),
      overView: json['overview'],
      releaseDate: json['release_date'],
      runTime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble());
}
