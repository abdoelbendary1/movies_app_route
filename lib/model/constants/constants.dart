class Constants {
  static const String iconPath = "assets/images/icons/";
  static const String imgPath = "assets/images/";

  static const String baseUrl = "https://api.themoviedb.org/3/movie/";
  static const String apiKey = "5a941d4b4f72eb0bfdf088082292c0a1";
  static const String imgUrl = "https://image.tmdb.org/t/p/w500/";
  static const String popular = "popular";
  static const String topRated = "top_rated";
  static const String upcoming = "upcoming";
  static const String api_key = "api_key";
  static const String popualrUrl = "$baseUrl$popular?$api_key=$apiKey";
  static const String topRatedUrl = "$baseUrl$topRated?$api_key=$apiKey";
  static const String upcomingUrl = "$baseUrl$upcoming?$api_key=$apiKey";
  /* https://api.themoviedb.org/3/movie//1011985?api_key=5a941d4b4f72eb0bfdf088082292c0a1 */
  static const String movieDetails = "$baseUrl$upcoming?$api_key=$apiKey";
}
