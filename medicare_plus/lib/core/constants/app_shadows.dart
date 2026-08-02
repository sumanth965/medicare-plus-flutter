import 'package:flutter/material.dart';

/// Soft elevation tokens for premium floating cards without harsh borders.
class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x140F172A),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  static const List<BoxShadow> glowBlue = [
    BoxShadow(
      color: Color(0x263B82F6),
      blurRadius: 32,
      offset: Offset(0, 16),
    ),
  ];
}
