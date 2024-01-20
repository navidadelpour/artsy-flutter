import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:artsy_app/utils/get_error_message.dart';
import 'package:artsy_app/utils/routeArguments/artist_detail_route_args.dart';
import 'package:artsy_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ArtistList extends StatelessWidget {
  const ArtistList({
    Key? key,
    required this.title,
    required this.document,
    required this.dataKey,
    this.variables,
  }) : super(key: key);

  final String title;
  final String document;
  final String dataKey;
  final Map<String, dynamic>? variables;

  static const double spacing = 16;
  static const double padding = 16;
  static const double minHeight = 250;

  Query get artistListQuery => Query(
        options: options,
        builder: queryBuilder,
      );

  QueryOptions get options => QueryOptions(
        document: gql(document),
        variables: variables ?? {},
      );

  Widget queryBuilder(
    QueryResult result, {
    Refetch? refetch,
    FetchMore? fetchMore,
  }) {
    if (result.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (result.hasException) {
      return EmptyPageMessage(
        text: getErrorMessage(result.exception) ?? "Error fetching artwork",
        icon: Icons.info_outline,
      );
    }

    List<dynamic> artists = result.data?[dataKey]["artists"];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(spacing),
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          children: List.generate(
            artists.length,
            (index) => [
              ArtistCard(artist: Artist.fromJson(artists[index])),
              if (index != artists.length - 1) const SizedBox(width: spacing),
            ],
          ).expand((element) => element).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Text _title = Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.caption,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            left: padding,
            top: padding,
            right: padding,
          ),
          child: _title,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: minHeight),
          child: artistListQuery,
        ),
      ],
    );
  }
}

class ArtistCard extends StatelessWidget {
  const ArtistCard({Key? key, required this.artist}) : super(key: key);

  final Artist artist;

  onTap(context) {
    Navigator.pushNamed(
      context,
      RouteNames.artist,
      arguments: ArtistDetailRouteArgs(artist.id!, artist.name!),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    Widget image = AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        artist.image?.url ?? "",
        fit: BoxFit.cover,
      ),
    );

    Widget header = Text(
      artist.name!,
      style: textTheme.headline6,
    );

    Widget subheader = Text(artist.getBirthInfo());

    return Card(
      margin: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () => onTap(context),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              image,
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: header,
              ),
              subheader
            ],
          ),
        ),
      ),
    );
  }
}
