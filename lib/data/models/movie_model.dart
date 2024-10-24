import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  Tmdb? tmdb;
  Imdb? imdb;
  Modified? modified;
  String? id;
  String? name;
  String? slug;
  String? originName;
  String? thumbUrl;
  String? posterUrl;
  int? year;

  MovieModel({
    this.tmdb,
    this.imdb,
    this.modified,
    this.id,
    this.name,
    this.slug,
    this.originName,
    this.thumbUrl,
    this.posterUrl,
    this.year,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        tmdb: json["tmdb"] == null ? null : Tmdb.fromJson(json["tmdb"]),
        imdb: json["imdb"] == null ? null : Imdb.fromJson(json["imdb"]),
        modified: json["modified"] == null
            ? null
            : Modified.fromJson(json["modified"]),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        originName: json["origin_name"],
        thumbUrl: json["thumb_url"],
        posterUrl: json["poster_url"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "tmdb": tmdb?.toJson(),
        "imdb": imdb?.toJson(),
        "modified": modified?.toJson(),
        "_id": id,
        "name": name,
        "slug": slug,
        "origin_name": originName,
        "thumb_url": thumbUrl,
        "poster_url": posterUrl,
        "year": year,
      };
}

class Imdb {
  String? id;

  Imdb({
    this.id,
  });

  factory Imdb.fromJson(Map<String, dynamic> json) => Imdb(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Modified {
  DateTime? time;

  Modified({
    this.time,
  });

  factory Modified.fromJson(Map<String, dynamic> json) => Modified(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toIso8601String(),
      };
}

class Tmdb {
  String? type;
  String? id;
  dynamic season;
  double? voteAverage;
  int? voteCount;

  Tmdb({
    this.type,
    this.id,
    this.season,
    this.voteAverage,
    this.voteCount,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
        type: json["type"],
        id: json["id"],
        season: json["season"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "season": season,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
