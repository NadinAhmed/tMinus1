import 'package:flutter/cupertino.dart';

class SettingsItemModel {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;

  const SettingsItemModel({
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
  });
}