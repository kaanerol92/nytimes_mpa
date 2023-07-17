import 'logger.dart';

mixin AutoLogger <T> {
  final Logger _logger = Logger<T>();
  Logger get logger => _logger;
}