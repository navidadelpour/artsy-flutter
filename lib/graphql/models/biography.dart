// ignore_for_file: non_constant_identifier_names

import 'package:artsy_app/graphql/models.dart';

class Biography {
  final String id;
  final Author? author;
  final String? href;
  final String? thumbnail_title;
  final String? thumbnail_teaser;
  final String? published_at;
  final Image_? thumbnail_image;

  Biography({
    required this.id,
    this.author,
    this.href,
    this.thumbnail_title,
    this.thumbnail_teaser,
    this.published_at,
    this.thumbnail_image,
  });

  Biography.fromJson(json)
      : id = json["id"],
        author = Author.fromJson(json["author"]),
        href = json["href"],
        thumbnail_title = json["thumbnail_title"],
        thumbnail_teaser = json["thumbnail_teaser"],
        published_at = json["published_at"],
        thumbnail_image = Image_.fromJson(json["thumbnail_image"]);
}
