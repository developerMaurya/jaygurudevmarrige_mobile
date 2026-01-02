import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import 'effect_badge.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final String icon;
  final List<String> badges;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.badges,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'people':
        return FontAwesomeIcons.users;
      case 'magic':
        return FontAwesomeIcons.wandMagicSparkles;
      case 'tree':
        return FontAwesomeIcons.tree;
      case 'gear':
        return FontAwesomeIcons.gear;
      case 'flower':
        return FontAwesomeIcons.spa;
      case 'stars':
        return FontAwesomeIcons.star;
      default:
        return FontAwesomeIcons.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isHovered
                ? AppTheme.accentGold
                : AppTheme.accentGold.withOpacity(0.1),
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 0,
                    offset: Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                _getIconData(widget.icon),
                size: 50,
                color: AppTheme.accentGold,
              ),
              SizedBox(height: 15),
              Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.badges
                    .map((badge) => EffectBadge(text: badge))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
