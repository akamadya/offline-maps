import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumX on num {
  BorderRadius r() {
    return BorderRadius.circular(toDouble());
  }

  Radius rx() {
    return Radius.circular(toDouble());
  }

  SizedBox ph() {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox pw() {
    return SizedBox(
      width: toDouble(),
    );
  }

  @Deprecated('function [format] has deprecated, please use [reform]')
  String format([
    String pattern = '#,##0',
    String locale = 'en_US',
    String prefix = '',
  ]) {
    final nf = NumberFormat(pattern, locale);
    return '$prefix${nf.format(this)}';
  }

  String reform({
    String pattern = '#,##0',
    String locale = 'en_US',
    String prefix = '',
  }) {
    final nf = NumberFormat(pattern, locale);
    return '$prefix${nf.format(this)}';
  }
}
