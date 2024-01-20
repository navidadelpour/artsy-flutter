// ignore_for_file: non_constant_identifier_names

import 'package:artsy_app/graphql/models.dart';

class Artwork {
  final String? id;
  final String? title;
  final String? category;
  final String? price;
  final Image_? image;
  final Artist? artist;
  final String? formattedMetadata;
  final String? medium;
  final String? width;
  final String? height;
  final num? widthCm;
  final num? heightCm;
  final String? metric;
  final bool? is_sold;
  final LabelDetails? conditionDescription;
  final LabelDetails? certificateOfAuthenticity;
  final LabelDetails? framed;

  const Artwork({
    this.id,
    this.title,
    this.category,
    this.price,
    this.image,
    this.artist,
    this.formattedMetadata,
    this.medium,
    this.width,
    this.height,
    this.widthCm,
    this.heightCm,
    this.metric,
    this.is_sold,
    this.conditionDescription,
    this.certificateOfAuthenticity,
    this.framed,
  });

  factory Artwork.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const Artwork();
    return Artwork(
      id: json['id'],
      title: json["title"],
      category: json["category"],
      price: json["price"],
      image: Image_.fromJson(json["image"]),
      artist: Artist.fromJson(json["artist"]),
      formattedMetadata: json["formattedMetadata"],
      medium: json["medium"],
      width: json["width"],
      height: json["height"],
      widthCm: json["widthCm"],
      heightCm: json["heightCm"],
      metric: json["metric"],
      is_sold: json["is_sold"],
      conditionDescription: LabelDetails.fromJson(json["conditionDescription"]),
      certificateOfAuthenticity:
          LabelDetails.fromJson(json["certificateOfAuthenticity"]),
      framed: LabelDetails.fromJson(json["framed"]),
    );
  }

  String? getDimensions({useMetric}) {
    String? _getDimentsion(width, height, metric) {
      if (width == null || height == null) {
        return null;
      }
      return "$width x $height $metric";
    }

    if (useMetric ?? true) {
      _getDimentsion(width, height, metric);
    } else {
      _getDimentsion(widthCm, heightCm, "cm");
    }
  }
}

class LabelDetails {
  final String? label;
  final String? details;

  LabelDetails({
    this.label,
    this.details,
  });

  factory LabelDetails.fromJson(Map<String, dynamic>? json) {
    return LabelDetails(
      label: json?["label"],
      details: json?["details"],
    );
  }
}
