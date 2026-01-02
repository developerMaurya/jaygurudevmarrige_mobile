import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/effect_badge.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Section Title
          Column(
            children: [
              Text(
                'About Jaygurudev Marriage Effect',
                style: AppTheme.sectionTitleStyle(context),
              ),
              SizedBox(height: 10),
              Container(width: 80, height: 3, color: AppTheme.accentGold),
            ],
          ),
          SizedBox(height: 40),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Content
              Container(
                padding: EdgeInsets.all(24),
                decoration: AppTheme.aboutContentDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Creating Magical Moments Since 2015',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Jaygurudev Marriage Effect specializes in transforming weddings and special '
                      'events into unforgettable experiences through state-of-the-art special effects. '
                      'We combine technical expertise with artistic vision to create breathtaking moments.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Our team of certified professionals has extensive experience with cold pyro '
                      'systems, fog machines, atmospheric effects, and stage production. We prioritize '
                      'safety while delivering wow-factor moments that your guests will remember forever.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Why Choose Us:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        _FeatureItem(
                          text: 'Certified Special Effects Technicians',
                        ),
                        _FeatureItem(text: 'Insured and Safety Compliant'),
                        _FeatureItem(text: 'State-of-the-Art Equipment'),
                        _FeatureItem(text: 'Custom Effect Design'),
                        _FeatureItem(text: 'Venue Coordination & Planning'),
                        _FeatureItem(text: '24/7 Support for Your Event'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Stats Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
                children: [
                  _StatCard(number: '250+', label: 'Events Completed'),
                  _StatCard(number: '8+', label: 'Years Experience'),
                  _StatCard(number: '100%', label: 'Safety Record'),
                  _StatCard(number: '50+', label: 'Venues Partnered'),
                ],
              ),

              SizedBox(height: 30),

              // Specializations
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Specializations:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        EffectBadge(text: 'Cold Pyro (Cold Fire)'),
                        EffectBadge(text: 'Fog & Smoke Machines'),
                        EffectBadge(text: 'Low Fog & Haze'),
                        EffectBadge(text: 'Confetti & Petal Cannons'),
                        EffectBadge(text: 'Atmospheric Lighting'),
                        EffectBadge(text: 'Stage Effect Design'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;

  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: AppTheme.accentGold, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: AppTheme.serviceCardDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: GoogleFonts.playfairDisplay(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppTheme.accentGold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
