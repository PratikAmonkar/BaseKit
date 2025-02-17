import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggingService {
  final Logger _logger;

  LoggingService(String loggerName) : _logger = Logger(loggerName) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(
      (LogRecord record) {
        if (kDebugMode) {
          print(
              '${record.level.name} (${record.loggerName}) : ${record.time}: ${record.message}');
        }
      },
    );
  }

  void finest(String message) => _log(Level.FINEST, message);

  void finer(String message) => _log(Level.FINER, message);

  void fine(String message) => _log(Level.FINE, message);

  void config(String message) => _log(Level.CONFIG, message);

  void info(String message) => _log(Level.INFO, message);

  void warning(String message) => _log(Level.WARNING, message);

  void severe(String message) => _log(Level.SEVERE, message);

  void shout(String message) => _log(Level.SHOUT, message);

  void _log(Level level, String message) {
    _logger.log(level, message);
  }
}
