class Author {
  final String? name;

  Author({
    this.name,
  });

  Author.fromJson(json) : name = json["name"];
}
