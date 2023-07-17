import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/util/logger.dart';

void main() {
  test("logger", () async {
    try {
      var logger = Logger<Logger>();
      logger.info("INFO LOGGING");
      logger.error("ERROR LOGGING");
    } catch (e) {
      assert(false);
    }
  });
}
