import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static const String YYYY_MM_DD_HH_MM = 'yyyy-MM-dd HH:mm';
  static const String DD_MMMM_YYYY = 'dd MMMM yyy';
  DateTime fromSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds);
  }

  static String formattedDate(
    String time, {
    String? inputPattern,
  }) {
    try {
      DateTime parseDate = DateFormat(
        inputPattern ?? DateUtil.YYYY_MM_DD_HH_MM,
      ).parse(time);

      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat(DateUtil.DD_MMMM_YYYY);
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    } catch (e, stackTrace) {
      if (kDebugMode) print('error: $e\nstackTrace: $stackTrace');
      return '';
    }
  }
}
