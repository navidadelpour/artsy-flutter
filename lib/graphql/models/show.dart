// ignore_for_file: non_constant_identifier_names

import 'package:artsy_app/graphql/models/image.dart';

class Show {
  final String? name;
  final String? city;
  final String? status;
  final String? exhibition_period;
  final Image_? cover_image;

  const Show({
    this.name,
    this.city,
    this.status,
    this.exhibition_period,
    this.cover_image,
  });

  Show.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        city = json["city"],
        status = json["status"],
        exhibition_period = json["exhibition_period"],
        cover_image = Image_.fromJson(json["cover_image"]);

  String getAttendanceInfo() {
    return "${city ?? ""}"
        "${city != null && exhibition_period != null ? ', ' : ''}"
        "${exhibition_period ?? ""}";
  }
}
