import 'package:flutter/material.dart';

class Styles {
  const Styles._();

  static const TextStyle _baseStyle = TextStyle(
    fontFamily: 'Inter',
  );

  static TextStyle textXLRegular = _baseStyle.copyWith(
    fontSize: 19,
  );
  static TextStyle textLRegular = _baseStyle.copyWith(
    fontSize: 16,
  );
  static TextStyle textMRegular = _baseStyle.copyWith(
    fontSize: 14,
  );
  static TextStyle textSRegular = _baseStyle.copyWith(
    fontSize: 12,
  );
  static TextStyle textXsRegular = _baseStyle.copyWith(
    fontSize: 11,
  );

  static TextStyle textXLBold = _baseStyle.copyWith(
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textLBold = _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textMBold = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textSBold = _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textXsBold = _baseStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );
}
