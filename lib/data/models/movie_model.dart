// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

import 'package:movie_app/data/models/episode_model.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  Tmdb? tmdb;
  Imdb? imdb;
  Created? created;
  Created? modified;
  String? id;
  String? name;
  String? originName;
  String? type;
  String? status;
  String? thumbUrl;
  String? posterUrl;
  bool? isCopyright;
  bool? subDocquyen;
  bool? chieurap;
  String? trailerUrl;
  String? time;
  String? episodeCurrent;
  String? episodeTotal;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  String? slug;
  String? content;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Category>? country;
  List<EpisodeModel>? episodeList;

  MovieModel({
    this.tmdb,
    this.imdb,
    this.created,
    this.modified,
    this.id,
    this.name,
    this.originName,
    this.type,
    this.status,
    this.thumbUrl,
    this.posterUrl,
    this.isCopyright,
    this.subDocquyen,
    this.chieurap,
    this.trailerUrl,
    this.time,
    this.episodeCurrent,
    this.episodeTotal,
    this.quality,
    this.lang,
    this.notify,
    this.showtimes,
    this.slug,
    this.year,
    this.view,
    this.actor,
    this.director,
    this.category,
    this.country,
    this.episodeList,
    this.content,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        tmdb: json["tmdb"] == null ? null : Tmdb.fromJson(json["tmdb"]),
        imdb: json["imdb"] == null ? null : Imdb.fromJson(json["imdb"]),
        created:
            json["created"] == null ? null : Created.fromJson(json["created"]),
        modified: json["modified"] == null
            ? null
            : Created.fromJson(json["modified"]),
        id: json["_id"],
        name: json["name"],
        originName: json["origin_name"],
        type: json["type"],
        status: json["status"],
        thumbUrl: json["thumb_url"],
        posterUrl: json["poster_url"],
        isCopyright: json["is_copyright"],
        subDocquyen: json["sub_docquyen"],
        chieurap: json["chieurap"],
        trailerUrl: json["trailer_url"],
        time: json["time"],
        episodeCurrent: json["episode_current"],
        episodeTotal: json["episode_total"],
        quality: json["quality"],
        lang: json["lang"],
        notify: json["notify"],
        showtimes: json["showtimes"],
        content: json["content"],
        slug: json["slug"],
        year: json["year"],
        view: json["view"],
        actor: json["actor"] == null
            ? []
            : List<String>.from(json["actor"]!.map((x) => x)),
        director: json["director"] == null
            ? []
            : List<String>.from(json["director"]!.map((x) => x)),
        category: json["category"] == null
            ? []
            : List<Category>.from(
                json["category"]!.map((x) => Category.fromJson(x))),
        country: json["country"] == null
            ? []
            : List<Category>.from(
                json["country"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tmdb": tmdb?.toJson(),
        "imdb": imdb?.toJson(),
        "created": created?.toJson(),
        "modified": modified?.toJson(),
        "_id": id,
        "name": name,
        "origin_name": originName,
        "type": type,
        "status": status,
        "thumb_url": thumbUrl,
        "poster_url": posterUrl,
        "is_copyright": isCopyright,
        "sub_docquyen": subDocquyen,
        "chieurap": chieurap,
        "trailer_url": trailerUrl,
        "time": time,
        "episode_current": episodeCurrent,
        "episode_total": episodeTotal,
        "quality": quality,
        "lang": lang,
        "notify": notify,
        "showtimes": showtimes,
        "content": content,
        "slug": slug,
        "year": year,
        "view": view,
        "actor": actor == null ? [] : List<dynamic>.from(actor!.map((x) => x)),
        "director":
            director == null ? [] : List<dynamic>.from(director!.map((x) => x)),
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "country": country == null
            ? []
            : List<dynamic>.from(country!.map((x) => x.toJson())),
      };
}

class Category {
  String? id;
  String? name;
  String? slug;

  Category({
    this.id,
    this.name,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Created {
  DateTime? time;

  Created({
    this.time,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toIso8601String(),
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

class Tmdb {
  String? type;
  String? id;
  int? season;
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
