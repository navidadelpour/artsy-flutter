// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:artsy_app/graphql/models.dart';

class Artist {
  final String? id;
  final String? name;
  final String? nationality;
  final String? birthday;
  final String? location;
  final Image_? image;
  final List<Artwork>? artworks;
  final List<Show>? shows;
  final Biography? biography;

  const Artist({
    this.id,
    this.name,
    this.nationality,
    this.birthday,
    this.location,
    this.image,
    this.artworks,
    this.shows,
    this.biography,
  });

  factory Artist.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const Artist();
    return Artist(
      id: json["id"],
      name: json["name"],
      nationality: json["nationality"],
      birthday: json["birthday"],
      location: json["location"],
      image: Image_.fromJson(json["image"]),
      artworks: json["artworks"]
          ?.map<Artwork>((artwork) => Artwork.fromJson(artwork))
          .toList(),
      shows: json["shows"]?.map<Show>((show) => Show.fromJson(show)).toList(),
      biography: json["biography"] != null
          ? Biography.fromJson(json["biography"])
          : null,
    );
  }

  String getBirthInfo() {
    return "${nationality ?? ""}"
        "${nationality != null && birthday != null ? ', ' : ''}"
        "${birthday != null ? 'b $birthday' : ''}";
  }
}
