// ignore_for_file: unused_import
import 'package:artsy_app/graphql/mocks.dart';
import 'package:artsy_app/pages/artworkDetail/artwork_detail.dart';
import 'package:artsy_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:artsy_app/utils/routes.dart';
import 'package:artsy_app/pages/home/home.dart';
import 'package:artsy_app/pages/artistDetail/artist_detail.dart';
import 'package:artsy_app/graphql/client.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    GraphQLProvider(
      client: client,
      child: ChangeNotifierProvider(
        create: (contet) => ThemeModel(),
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => MaterialApp(
        title: "Artsy",
        themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        initialRoute: "/",
        routes: {
          RouteNames.home: (context) => const Home(),
          RouteNames.artist: (context) => const ArtistDetail(),
          RouteNames.artwork: (context) => const ArtworkDetail(),
        },
      ),
    );
  }
}
