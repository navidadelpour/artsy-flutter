const String popularArtistsDocument = """
  query PopularArtists {
    popular_artists {
      artists {
        id
        name
        nationality
        birthday
        image {
          url
        }
      }
    }
  }
""";

const String trendingArtistsDocument = """
  query TrendingArtists(\$name: TrendingMetrics!) {
    trending_artists(name: \$name) {
      artists {
        id
        name
        nationality
        birthday
        image {
          url
        }
      }
    }
  }
""";

const String artistDocument = """
  query Artist(\$id: String!) {
    artist(id: \$id) {
      id
      name
      nationality
      birthday
      location
      image {
        url
      }
      biography {
        id
        author {
          name
        }
        href
        thumbnail_title
        thumbnail_teaser
        published_at
        thumbnail_image {
          url
        }
      }
      artworks {
        id
        title
        category
        is_sold
        price
        image {
          url
        }
      }
      shows {
        id
        name
        exhibition_period
        city
        status
        cover_image {
          url
        }
      }
    }
  }
""";
