import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../theme/app_theme.dart';
import '../widgets/gallery_item.dart';

class GalleryPage extends StatelessWidget {
  final List<String> galleryImages = List.generate(
    31,
    (index) => 'assets/images/${index + 1}.jpg',
  );

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
                'Our Work Gallery',
                style: AppTheme.sectionTitleStyle(context),
              ),
              SizedBox(height: 10),
              Container(width: 80, height: 3, color: AppTheme.accentGold),
              SizedBox(height: 20),
              Text(
                'Browse through our portfolio of stunning event effects and transformations',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 40),

          // Gallery Grid
          // Gallery Grid
          MasonryGridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 900
                ? 3
                : MediaQuery.of(context).size.width > 600
                ? 2
                : 1,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            itemCount: galleryImages.length,
            itemBuilder: (context, index) {
              return GalleryItem(
                    imagePath: galleryImages[index],
                    title: 'Event Image ${index + 1}',
                  )
                  .animate()
                  .fadeIn(delay: (index * 50).ms)
                  .slideY(begin: 0.1, duration: 400.ms);
            },
          ),
        ],
      ),
    );
  }
}
