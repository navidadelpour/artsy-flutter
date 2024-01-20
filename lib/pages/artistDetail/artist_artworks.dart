import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:artsy_app/utils/routeArguments/artwork_detail_route_args.dart';
import 'package:artsy_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:transparent_image/transparent_image.dart';

class ArtistArtowks extends StatelessWidget {
  const ArtistArtowks({
    Key? key,
    required this.artworks,
  }) : super(key: key);

  final List<Artwork> artworks;

  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    if (artworks.isEmpty) {
      return const EmptyPageMessage(
        text: "No artwork found",
        icon: Icons.info_outline,
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(spacing),
            child: MasonryGrid(
                column: 2,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                children: List.generate(
                  artworks.length,
                  (index) => ArtworkCard(artwork: artworks[index]),
                )),
          ),
        )
      ],
    );
  }
}

class ArtworkCard extends StatelessWidget {
  const ArtworkCard({Key? key, required this.artwork}) : super(key: key);

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.all(0),
      child: InkWell(
        splashColor: Colors.black.withAlpha(30),
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteNames.artwork,
            arguments: ArtworkDetailRouteArgs(artwork.id!, artwork.title!),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: artwork.image?.url ?? "",
            ),
            if (artwork.price != null && artwork.price!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Text(artwork.price!, style: textTheme.headline5),
              ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(artwork.title ?? "", style: textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: Text(artwork.category ?? "", style: textTheme.caption),
            ),
          ],
        ),
      ),
    );
  }
}
