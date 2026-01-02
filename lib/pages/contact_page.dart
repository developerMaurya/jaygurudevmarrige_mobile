import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import '../widgets/contact_item.dart';
import '../models/contact_info.dart';

class ContactPage extends StatelessWidget {
  final List<ContactInfo> contactInfo = ContactInfo.getContactInfo();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Section Title
          Column(
            children: [
              Text('Get In Touch', style: AppTheme.sectionTitleStyle(context)),
              SizedBox(height: 10),
              Container(width: 80, height: 3, color: AppTheme.accentGold),
              SizedBox(height: 20),
              Text(
                'Ready to create magical moments at your event? Contact us for a consultation.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 40),

          // Contact Info Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.3,
            ),
            itemCount: contactInfo.length,
            itemBuilder: (context, index) {
              final info = contactInfo[index];
              return ContactItem(
                title: info.title,
                value: info.value,
                icon: info.icon,
                url: info.url,
              );
            },
          ),

          SizedBox(height: 40),

          // Social Icons
          Text(
            'Connect with us on social media',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(icon: FontAwesomeIcons.facebookF),
              SizedBox(width: 15),
              _SocialButton(icon: FontAwesomeIcons.instagram),
              SizedBox(width: 15),
              _SocialButton(icon: FontAwesomeIcons.pinterestP),
              SizedBox(width: 15),
              _SocialButton(icon: FontAwesomeIcons.whatsapp),
              SizedBox(width: 15),
              _SocialButton(icon: FontAwesomeIcons.youtube),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;

  const _SocialButton({required this.icon});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: _isHovered
              ? AppTheme.accentGold
              : Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: 20,
            color: _isHovered ? AppTheme.primaryDark : AppTheme.textLight,
          ),
        ),
      ),
    );
  }
}
