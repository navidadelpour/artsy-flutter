// ignore_for_file: non_constant_identifier_names, camel_case_types

class Image_ {
  final String? url;

  const Image_({this.url});

  Image_.fromJson(Map<String, dynamic> json) : url = json["url"];
}
