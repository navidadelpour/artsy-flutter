import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:flutter/material.dart';

class ArtistShows extends StatelessWidget {
  const ArtistShows({Key? key, required this.shows}) : super(key: key);

  final List<Show> shows;

  static const double spacing = 16;

  @override
  Widget build(BuildContext context) {
    if (shows.isEmpty) {
      return const EmptyPageMessage(
        text: "No artwork found",
        icon: Icons.info_outline,
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(spacing),
      itemCount: shows.length,
      separatorBuilder: (context, index) => const SizedBox(height: spacing),
      itemBuilder: (context, index) => ShowCard(show: shows[index]),
    );
  }
}

class ShowCard extends StatelessWidget {
  const ShowCard({Key? key, required this.show}) : super(key: key);

  final Show show;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          debugPrint("hey");
        },
        child: Column(
          children: [
            if (show.cover_image?.url != null)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      child: Image.network(show.cover_image!.url!,
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (show.name != null)
                    Text(show.name!, style: textTheme.headline6),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(show.getAttendanceInfo())),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(show.status ?? ""),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
