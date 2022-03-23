import 'exceptions.dart';

typedef JsonObject = Map<String, dynamic>;

void check(bool condition, String message) {
  if (!condition) {
    throw EposError(message);
  }
}
