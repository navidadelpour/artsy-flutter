import 'package:graphql_flutter/graphql_flutter.dart';

String? getErrorMessage(OperationException? error) {
  if (error?.linkException != null) return error?.linkException?.toString();
  return error?.graphqlErrors.map((e) => e.message).join(", ");
}
