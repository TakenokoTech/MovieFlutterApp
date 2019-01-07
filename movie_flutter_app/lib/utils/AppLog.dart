import 'package:flutter/material.dart';

class AppLog {
  static void debug(String str) {
    debugPrint('[AppLog] ' + str);
  }
}