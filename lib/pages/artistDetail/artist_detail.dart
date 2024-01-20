import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/components/toggle_theme_button.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:artsy_app/graphql/query/artists_document.dart';
import 'package:artsy_app/pages/artistDetail/artist_artworks.dart';
import 'package:artsy_app/pages/artistDetail/artist_biography.dart';
import 'package:artsy_app/pages/artistDetail/artist_detail_header.dart';
import 'package:artsy_app/pages/artistDetail/artist_shows.dart';
import 'package:artsy_app/utils/get_error_message.dart';
import 'package:artsy_app/utils/routeArguments/artist_detail_route_args.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ArtistDetail extends StatelessWidget {
  const ArtistDetail({Key? key}) : super(key: key);

  QueryOptions queryOptions(artistDetailRouteArgs) {
    return QueryOptions(
      document: gql(artistDocument),
      variables: {
        "id": artistDetailRouteArgs.id,
      },
    );
  }

  Widget queryBuilder(
    QueryResult result, {
    FetchMore? fetchMore,
    Refetch? refetch,
  }) {
    if (result.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (result.hasException) {
      return EmptyPageMessage(
        text: getErrorMessage(result.exception) ?? "Error fetching artist",
        icon: Icons.info_outline,
      );
    }

    Artist artist = Artist.fromJson(result.data?["artist"]);

    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 4,
          child: Column(
            children: [
              ArtistDetailHeader(artist: artist),
              const ArtistDetailTabBar(),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              ArtistBiography(biography: artist.biography),
              ArtistArtowks(artworks: artist.artworks ?? []),
              ArtistShows(shows: artist.shows ?? []),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ArtistDetailRouteArgs artistDetailRouteArgs =
        ModalRoute.of(context)!.settings.arguments as ArtistDetailRouteArgs;

    Query artistDetailQuery = Query(
      options: queryOptions(artistDetailRouteArgs),
      builder: queryBuilder,
    );

    AppBar appBar = AppBar(
      title: Text(artistDetailRouteArgs.name),
      actions: const [
        ToggleThemeButton(),
      ],
      elevation: 0,
    );

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: appBar,
        body: artistDetailQuery,
      ),
    );
  }
}

class ArtistDetailTabBar extends StatelessWidget {
  const ArtistDetailTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.onSurface;

    return TabBar(
      labelColor: color,
      indicatorColor: color,
      tabs: const <Widget>[
        Tab(text: "BIOGRAPHY"),
        Tab(text: "WORKS"),
        Tab(text: "SHOWS"),
      ],
    );
  }
}
