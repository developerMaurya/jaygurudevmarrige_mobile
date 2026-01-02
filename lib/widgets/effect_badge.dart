import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EffectBadge extends StatelessWidget {
  final String text;
  final double? fontSize;

  const EffectBadge({super.key, required this.text, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppTheme.accentGold.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.accentGold.withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppTheme.accentGold,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
