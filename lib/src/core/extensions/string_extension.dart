import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

extension FormatString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toEnglishNumbers() {
    return replaceAll("٠", "0")
        .replaceAll("١", "1")
        .replaceAll("٢", "2")
        .replaceAll("٣", "3")
        .replaceAll("٤", "4")
        .replaceAll("٥", "5")
        .replaceAll("٦", "6")
        .replaceAll("٧", "7")
        .replaceAll("٨", "8")
        .replaceAll("٩", "9");
  }

  String toCurrency() {
    final formatter = NumberFormat("#,###");
    return formatter.format(double.parse(this));
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: this));
  }

  String get locale {
    return this.tr();
  }

  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  String toCamelCase() {
    return this[0].toUpperCase() +
        substring(1).replaceAllMapped(
            RegExp('[_-](.)'), (Match match) => match.group(1)!.toLowerCase());
  }
}

extension FormatDouble on double {
  String toCurrency() {
    final formatter = NumberFormat("#,###");
    return formatter.format(this);
  }
}
