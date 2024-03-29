const showDocument = """
  query Show(\$id: String!) {
    show(id: \$id) {
      id
      name
      city
      description
      exhibition_period
      kind
      status
      press_release
      href
      counts {
        artists
        artworks
      }
      cover_image {
        url
      }
      images {
        url
      }
    }
  }
""";
