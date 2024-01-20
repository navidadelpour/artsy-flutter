import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/components/toggle_theme_button.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:artsy_app/graphql/query/artwork_document.dart';
import 'package:artsy_app/utils/get_error_message.dart';
import 'package:artsy_app/utils/routeArguments/artwork_detail_route_args.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ArtworkDetail extends StatelessWidget {
  const ArtworkDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ArtworkDetailRouteArgs artworkDetailRouteArgs =
        ModalRoute.of(context)!.settings.arguments as ArtworkDetailRouteArgs;

    Query query = Query(
      options: QueryOptions(
          document: gql(artworkDocument),
          variables: {"id": artworkDetailRouteArgs.id}),
      builder: (result, {fetchMore, refetch}) {
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

        Artwork artwork = Artwork.fromJson(
          result.data?["artwork"],
        );

        return ListView(
          children: [
            buildImage(artwork),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                artwork.formattedMetadata!,
                style: textTheme.caption,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(artwork.artist!.image!.url!),
              ),
              title: Text(
                artwork.artist!.name!,
                style: textTheme.headline6,
              ),
              subtitle: Text(artwork.artist!.getBirthInfo()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(artwork.title ?? "", style: textTheme.headline5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(artwork.medium ?? ""),
                  ),
                  buildDimension(artwork, useMetric: false),
                  buildDimension(artwork),
                  if (artwork.category != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        artwork.category!,
                        style: textTheme.subtitle1,
                      ),
                    ),
                  const Divider(),
                  if (artwork.price != null && artwork.price!.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          artwork.price!,
                          style: textTheme.headline6,
                        ),
                        if (artwork.is_sold != null)
                          Chip(
                            label: Text(artwork.is_sold! ? "Sold" : "Not sold"),
                            backgroundColor: artwork.is_sold!
                                ? Colors.red.withOpacity(.3)
                                : Colors.green.withOpacity(.3),
                          ),
                      ],
                    ),
                    const Divider(),
                  ],
                ],
              ),
            ),
            ...[
              artwork.conditionDescription,
              artwork.certificateOfAuthenticity,
              artwork.framed
            ].map(
              (item) => (item?.label == null || item?.details == null)
                  ? Container()
                  : ListTile(
                      title: Text(item!.label!),
                      subtitle: Text(item.details!),
                    ),
            )
          ],
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(artworkDetailRouteArgs.title),
        actions: const [
          ToggleThemeButton(),
        ],
      ),
      body: query,
    );
  }

  AspectRatio buildImage(Artwork artwork) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        artwork.image!.url!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDimension(Artwork artwork, {bool? useMetric}) {
    String? dimension = artwork.getDimensions(useMetric: useMetric);
    if (dimension != null && dimension.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(dimension),
      );
    } else {
      return Container();
    }
  }
}
