import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateToString(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('dd MMMM yyyy HH:mm').format(d);
}

String dateToHoureMinuteSecond(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('HH:mm:ss').format(d);
}

String dateToStringLocal(
    BuildContext context, DateTime? d, bool? isHari, bool? isHour) {
  if (d == null) {
    return '-';
  }
  final locale = Localizations.localeOf(context).languageCode;
  final hari = DateFormat('EEEE', locale).format(d);
  final bulan = DateFormat('MMMM', locale).format(d);
  final day = DateFormat('dd').format(d);
  final year = DateFormat('yyyy').format(d);
  final jam = DateFormat('HH:mm').format(d);
  return '${isHari == false ? '' : '$hari ,'} $day $bulan $year ${isHour == false ? '' : jam}';
}

String dateToStringLocalShort(BuildContext context, DateTime? d, bool? isHour) {
  if (d == null) {
    return '-';
  }
  final locale = Localizations.localeOf(context).languageCode;
  final hari = DateFormat('EEEE', locale).format(d);
  final bulan = DateFormat('MMM', locale).format(d);
  final day = DateFormat('dd').format(d);
  final year = DateFormat('yyyy').format(d);
  final jam = DateFormat('HH:mm').format(d);
  return '$day $bulan $year ${isHour == false ? '' : jam}';
}

String dateToStringWithDay(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('EEE, dd MMMM yyyy HH:mm').format(d);
}

String dateToStringNoJam(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('dd MMMM yyyy').format(d);
}

String dateToHour(String ds) {
  if (ds.isEmpty) {
    return '--:--';
  }

  final d = DateTime.parse(ds);
  return DateFormat('HH:mm').format(d);
}

String dateToStringParams(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('yyyy-MM-dd HH:mm').format(d);
}

String dateToStringNoHour(DateTime? d) {
  if (d == null) {
    return '';
  }
  return DateFormat('yyyy-MM-dd').format(d);
}

String formatHourNow(DateTime? d) {
  if (d == null) {
    return '';
  }

  if (dateToStringNoHour(d) == dateToStringNoHour(DateTime.now())) {
    return DateFormat('HH:mm').format(d);
  } else if (DateFormat('yyyy').format(d) ==
      DateFormat('yyyy').format(DateTime.now())) {
    return DateFormat('dd MMM').format(d);
  } else {
    return DateFormat('dd MMM yyyy').format(d);
  }
}

List<String> months = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];
