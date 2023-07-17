import 'dart:developer';

class Logger<T> {

  info(String? message) {
    log("\x1B[92m[${DateTime.now()}] [${T.toString()}] [INFO] $message\x1B[0m");
  }

  error(String? message) {
    log("\x1B[91m[${DateTime.now()}] [${T.toString()}] [ERROR] $message\x1B[0m");
  }

}