import 'package:flutter_test/flutter_test.dart';
import 'package:nytimes_mpa/src/util/auto_logger.dart';

void main() {
  test("autologger", () async {
    try {
      var autoLogger = TestingAutoLogger();
      autoLogger.logger.info("INFO LOGGING");
      autoLogger.logger.error("ERROR LOGGING");
    } catch (e) {
      assert(false);
    }
  });
}

class TestingAutoLogger with AutoLogger<TestingAutoLogger> {}
