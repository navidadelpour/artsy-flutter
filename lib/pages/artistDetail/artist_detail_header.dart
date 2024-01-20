import 'package:artsy_app/graphql/models.dart';
import 'package:flutter/material.dart';

class ArtistDetailHeader extends StatelessWidget {
  const ArtistDetailHeader({Key? key, required this.artist}) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              if (artist.name != null)
                Text(
                  artist.name!,
                  style: textTheme.headline6,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  artist.getBirthInfo(),
                  style: textTheme.bodyText2,
                ),
              ),
              if (artist.location != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                    ),
                    Text(
                      artist.location ?? "",
                      style: textTheme.caption,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
