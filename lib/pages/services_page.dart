import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/service_card.dart';
import '../models/service.dart';

class ServicesPage extends StatelessWidget {
  final List<Service> services = Service.getServices();

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
                'Our Premium Services',
                style: AppTheme.sectionTitleStyle(context),
              ),
              SizedBox(height: 10),
              Container(width: 80, height: 3, color: AppTheme.accentGold),
            ],
          ),
          SizedBox(height: 40),

          // Services Grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 900
                  ? 3
                  : MediaQuery.of(context).size.width > 600
                  ? 2
                  : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return ServiceCard(
                title: service.title,
                description: service.description,
                icon: service.icon,
                badges: service.badges,
              );
            },
          ),
        ],
      ),
    );
  }
}
