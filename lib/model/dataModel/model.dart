// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

import 'package:movies_app_route/model/dataModel/movie/movie.dart';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    Model({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}


enum OriginalLanguage {
    EN,
    ID,
    PT,
    ZH
}

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "id": OriginalLanguage.ID,
    "pt": OriginalLanguage.PT,
    "zh": OriginalLanguage.ZH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
