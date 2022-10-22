import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Utils {
  static String printJson(Object? json, [bool log = false]) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String output = encoder.convert(json);
    if (log) debugPrint(output);
    return output;
  }

  static String dateToJson(DateTime date) {
    final pattern = DateFormat('yyyy-MM-dd');
    final formatted = pattern.format(date);
    return formatted;
  }

  static String dateToView(DateTime date) {
    final pattern = DateFormat('dd.MM.yyyy');
    final formatted = pattern.format(date);
    return formatted;
  }
}
