import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final Function(int) onNavigate;

  const Footer({super.key, required this.onNavigate});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.footerDark,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Logo and Description
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.star,
                    color: AppTheme.accentGold,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Jaygurudev Marriage Effect',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.accentGold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Creating unforgettable moments with professional special effects for weddings and events since 2015.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 20,
                children: [
                  _FooterLink(text: 'Home', onTap: () => onNavigate(0)),
                  _FooterLink(text: 'Services', onTap: () => onNavigate(1)),
                  _FooterLink(text: 'Gallery', onTap: () => onNavigate(2)),
                  _FooterLink(text: 'About', onTap: () => onNavigate(3)),
                  _FooterLink(text: 'Contact', onTap: () => onNavigate(4)),
                ],
              ),
            ],
          ),

          SizedBox(height: 30),

          // Social Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.facebookF,
                onTap: () => _launchUrl('https://www.facebook.com'),
              ),
              SizedBox(width: 15),
              _SocialIcon(
                icon: FontAwesomeIcons.instagram,
                onTap: () => _launchUrl('https://www.instagram.com'),
              ),
              SizedBox(width: 15),
              _SocialIcon(
                icon: FontAwesomeIcons.pinterestP,
                onTap: () => _launchUrl('https://www.pinterest.com'),
              ),
              SizedBox(width: 15),
              _SocialIcon(
                icon: FontAwesomeIcons.whatsapp,
                onTap: () => _launchUrl('https://wa.me/7651972973'),
              ),
              SizedBox(width: 15),
              _SocialIcon(
                icon: FontAwesomeIcons.youtube,
                onTap: () => _launchUrl(
                  'https://www.youtube.com/@spvlogsandeventdecoration',
                ),
              ),
            ],
          ),

          SizedBox(height: 30),

          // Copyright
          Text(
            '© 2023 Jaygurudev Marriage Effect. All rights reserved.',
            style: TextStyle(
              color: AppTheme.textLight.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Professional Event Special Effects & Management',
            style: TextStyle(color: AppTheme.accentSilver, fontSize: 12),
          ),

          SizedBox(height: 30),

          // Safety Notice
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Cold pyro, fog machines, and smoke effects should always be operated by certified professionals. '
              'All our equipment meets safety standards and is operated by licensed technicians.',
              style: TextStyle(
                color: AppTheme.textLight.withOpacity(0.6),
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
              color: AppTheme.textLight,
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.accentGold
                : Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: 18,
              color: _isHovered ? AppTheme.primaryDark : AppTheme.textLight,
            ),
          ),
        ),
      ),
    );
  }
}
