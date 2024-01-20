import 'package:artsy_app/components/artsy_logo.dart';
import 'package:artsy_app/components/toggle_theme_button.dart';
import 'package:artsy_app/graphql/query/artists_document.dart';
import 'package:artsy_app/pages/home/artist_list.dart';
import 'package:artsy_app/pages/home/home_header.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: const Text("Artsy"),
      actions: const [
        ToggleThemeButton(),
      ],
      leading: const ArtsyLogo(),
    );

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: const <Widget>[
          HomeHeader(),
          ArtistList(
            title: "popular artists",
            dataKey: "popular_artists",
            document: popularArtistsDocument,
          ),
          ArtistList(
            title: "most followed",
            dataKey: "trending_artists",
            variables: {"name": "ARTIST_FOLLOW"},
            document: trendingArtistsDocument,
          ),
          ArtistList(
            title: "trending artists",
            dataKey: "trending_artists",
            variables: {"name": "ARTIST_INQUIRY"},
            document: trendingArtistsDocument,
          ),
          ArtistList(
            title: "with most artworks in fairs",
            dataKey: "trending_artists",
            variables: {"name": "ARTIST_FAIR"},
            document: trendingArtistsDocument,
          ),
        ],
      ),
    );
  }
}
