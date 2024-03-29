// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieDetails {
  bool adult;
  String backdropPath;
  /*  BelongsToCollection belongsToCollection;
  int budget;
  List<Genre> genres; */
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  /*  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries; */
  DateTime releaseDate;
  int revenue;
  int runtime;
  /*  List<SpokenLanguage> spokenLanguages; */
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    /*  required this.belongsToCollection,
    required this.budget,
    required this.genres, */
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    /* required this.productionCompanies,
    required this.productionCountries, */
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    /* required this.spokenLanguages, */
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      /* 'belongsToCollection': belongsToCollection.toMap(),
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(), */
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      /* 'productionCompanies': productionCompanies.map((x) => x.toMap()).toList(),
      'productionCountries': productionCountries.map((x) => x.toMap()).toList(), */
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'revenue': revenue,
      'runtime': runtime,
      /* 'spokenLanguages': spokenLanguages.map((x) => x.toMap()).toList(), */
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieDetails.fromJson(Map<String, dynamic> map) {
    return MovieDetails(
      adult: map['adult'] as bool,
      backdropPath: map['backdropPath'] as String,
      /*  belongsToCollection: BelongsToCollection.fromMap(
          map['belongsToCollection'] as Map<String, dynamic>), */
      /*  budget: map['budget'] as int, */
      /*  genres: List<Genre>.from(
        (map['genres'] as List<int>).map<Genre>(
          (x) => Genre.fromMap(x as Map<String, dynamic>),
        ),
      ), */
      homepage: map['homepage'] as String,
      id: map['id'] ?? 1 as int,
      imdbId: map['imdbId'] ?? "" as String,
      originalLanguage: map['originalLanguage'] ?? "" as String,
      originalTitle: map['originalTitle'] ?? "" as String,
      overview: map['overview'] ?? "" as String,
      popularity: map['popularity'] as double,
      posterPath: map['posterPath'] ?? "" as String,
      /*   productionCompanies: List<ProductionCompany>.from(
        (map['productionCompanies'] as List<int>).map<ProductionCompany>(
          (x) => ProductionCompany.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productionCountries: List<ProductionCountry>.from(
        (map['productionCountries'] as List<int>).map<ProductionCountry>(
          (x) => ProductionCountry.fromMap(x as Map<String, dynamic>),
        ),
      ), */
      releaseDate:
          DateTime.fromMillisecondsSinceEpoch(map['releaseDate'] ?? 1 as int),
      revenue: map['revenue'] ?? 1 as int,
      runtime: map['runtime'] ?? 1 as int,
      /*  spokenLanguages: List<SpokenLanguage>.from(
        (map['spokenLanguages'] as List<int>).map<SpokenLanguage>(
          (x) => SpokenLanguage.fromMap(x as Map<String, dynamic>),
        ),
      ), */
      status: map['status'] ?? "" as String,
      tagline: map['tagline'] ?? "" as String,
      title: map['title'] ?? "" as String,
      video: map['video'] ?? "" as bool,
      voteAverage: map['voteAverage'] ?? 1.0 as double,
      voteCount: map['voteCount'] ?? 1 as int,
    );
  }

  /*  String toJson() => json.encode(toMap());

  factory MovieDetails.fromJson(String source) => MovieDetails.fromMap(json.decode(source) as Map<String, dynamic>); */
}

/* class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id'] as int,
      name: map['name'] as String,
      posterPath: map['posterPath'] as String,
      backdropPath: map['backdropPath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genre.fromMap(Map<String, dynamic> map) {
    return Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Genre.fromJson(String source) =>
      Genre.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id'] as int,
      logoPath: map['logoPath'] as String,
      name: map['name'] as String,
      originCountry: map['originCountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) =>
      ProductionCompany.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso31661: map['iso31661'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) =>
      ProductionCountry.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'englishName': englishName,
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      englishName: map['englishName'] as String,
      iso6391: map['iso6391'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source) as Map<String, dynamic>);
}
 */