import 'package:logger/logger.dart';

final _logger = Logger();
void logger(dynamic message, {Level level = Level.debug}) {
  // debugPrint(message.toString());
  _logger.log(level, message);
}
