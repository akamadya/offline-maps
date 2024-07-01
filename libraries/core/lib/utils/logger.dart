import 'dart:developer';

class AppLogger {
  AppLogger({this.appName = 'LOG'});

  final String appName;

  void print([String message = '', StackTrace? stackTrace]) {
    log(message, name: appName, stackTrace: stackTrace, time: DateTime.now());
  }
}
