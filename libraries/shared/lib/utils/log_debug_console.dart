import 'package:flutter/material.dart';

void logI(String msg) {
  debugPrint('\x1B[32m$msg\x1B[0m');
}

void logW(String msg) {
  debugPrint('\x1B[33m$msg\x1B[0m');
}

void logE(String msg) {
  debugPrint('\x1B[31m$msg\x1B[0m');
}

void logBlink(String msg) {
  debugPrint('\x1B[33;5m$msg\x1B[0m');
}
