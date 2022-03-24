import 'exceptions.dart';

typedef JsonObject = Map<dynamic, dynamic>;

void check(bool condition, String message) {
  if (!condition) {
    throw EposError(message);
  }
}
