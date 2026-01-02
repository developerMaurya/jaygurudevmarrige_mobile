import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ContactItem extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  final String? url;

  const ContactItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.url,
  });

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'geo-alt':
        return FontAwesomeIcons.locationDot;
      case 'person':
        return FontAwesomeIcons.user;
      case 'telephone':
        return FontAwesomeIcons.phone;
      case 'whatsapp':
        return FontAwesomeIcons.whatsapp;
      default:
        return FontAwesomeIcons.envelope;
    }
  }

  Future<void> _launchURL(BuildContext context) async {
    if (url != null) {
      final uri = Uri.parse(url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: url != null ? () => _launchURL(context) : null,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.accentGold,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  _getIconData(icon),
                  color: AppTheme.primaryDark,
                  size: 24,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (url != null) ...[
              SizedBox(height: 8),
              Text(
                'Tap to contact',
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.accentGold.withOpacity(0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
