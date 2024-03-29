

class Genres {
  final String name;
  final int id;

  const Genres({required this.name, required this.id});
}

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});
  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      GenresModel(name: json['name'], id: json['id']);
}
