import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink("https://metaphysics-production.artsy.net");

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);
