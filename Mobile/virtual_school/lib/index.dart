import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF242424);
  static const Color secondaryColor = Color(0xFF646cff);
  static const Color backgroundColor = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const TextStyle bodyText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    color: AppTheme.primaryColor,
  );
  static const TextStyle linkText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.0,
    color: AppTheme.secondaryColor,
    fontWeight: FontWeight.w500,
  );
}

