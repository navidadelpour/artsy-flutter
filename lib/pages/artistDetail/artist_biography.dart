import 'package:artsy_app/components/empty_page_message.dart';
import 'package:artsy_app/graphql/models.dart';
import 'package:artsy_app/pages/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArtistBiography extends StatelessWidget {
  const ArtistBiography({Key? key, this.biography}) : super(key: key);

  final Biography? biography;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    if (biography == null) {
      return const EmptyPageMessage(
        text: "No biography available",
        icon: Icons.info_outline,
      );
    }

    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(16),
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (biography!.thumbnail_image?.url != null) buildImage(),
              if (biography!.thumbnail_title != null) buildTitle(textTheme),
              buildAuthor(textTheme),
              if (biography!.thumbnail_teaser != null) buildTeaser(),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(url: biography!.href!),
            ),
          );
        },
        child: const Text("READ MORE"),
      ),
    );
  }

  Widget buildTeaser() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 12,
        top: 18,
      ),
      child: Text(biography!.thumbnail_teaser!),
    );
  }

  Widget buildAuthor(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (biography!.author?.name != null)
            Text(
              biography!.author!.name!,
              style: textTheme.bodyText2,
            ),
          if (biography!.published_at != null)
            Text(
              DateFormat("yyyy-MM-dd").format(
                DateTime.parse(biography!.published_at!),
              ),
              style: textTheme.caption,
            ),
        ],
      ),
    );
  }

  Widget buildTitle(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 8,
        top: 12,
      ),
      child: Text(
        biography!.thumbnail_title!,
        style: textTheme.headline5,
      ),
    );
  }

  Widget buildImage() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 150,
            child: Image.network(
              biography!.thumbnail_image!.url!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
