// To parse this JSON data, do
//
//     final episodeModel = episodeModelFromJson(jsonString);

class EpisodeModel {
  String? serverName;
  List<ServerDatum>? serverData;

  EpisodeModel({
    this.serverName,
    this.serverData,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        serverName: json["server_name"],
        serverData: json["server_data"] == null
            ? []
            : List<ServerDatum>.from(
                json["server_data"]!.map((x) => ServerDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "server_name": serverName,
        "server_data": serverData == null
            ? []
            : List<dynamic>.from(serverData!.map((x) => x.toJson())),
      };
}

class ServerDatum {
  String? name;
  String? slug;
  String? filename;
  String? linkEmbed;
  String? linkM3U8;

  ServerDatum({
    this.name,
    this.slug,
    this.filename,
    this.linkEmbed,
    this.linkM3U8,
  });

  factory ServerDatum.fromJson(Map<String, dynamic> json) => ServerDatum(
        name: json["name"],
        slug: json["slug"],
        filename: json["filename"],
        linkEmbed: json["link_embed"],
        linkM3U8: json["link_m3u8"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "filename": filename,
        "link_embed": linkEmbed,
        "link_m3u8": linkM3U8,
      };
}
