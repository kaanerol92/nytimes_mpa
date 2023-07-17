import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static get baseUrl => dotenv.get("BASE_URL");
  static get viewedEndpoint => dotenv.get("VIEWED_ENDPOINT");
  static get apiKey => dotenv.get("API_KEY");
}