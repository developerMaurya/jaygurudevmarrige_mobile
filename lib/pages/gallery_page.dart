import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/gallery_item.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> _generateImages(String basePath, int count) {
    // Generate images in ascending order (e.g., 1, 2, ... count)
    return List.generate(count, (index) => '$basePath${index + 1}.jpg');
  }

  @override
  Widget build(BuildContext context) {
    // Image Data
    final allImages = _generateImages('assets/images/', 31);
    final gunImages = _generateImages('assets/marrige_theam/gun/', 11);
    final pyroImages = _generateImages('assets/marrige_theam/payro/', 18);
    final fogImages = _generateImages('assets/marrige_theam/fog/', 15);
    final balloonImages = _generateImages('assets/marrige_theam/ballon/', 5);
    final otherImages = _generateImages('assets/marrige_theam/other/', 22);

    final List<List<String>> imageSets = [
      allImages,
      gunImages,
      pyroImages,
      fogImages,
      balloonImages,
      otherImages,
    ];

    return Column(
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
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
        ),

        // Tab Bar
        Container(
          color: AppTheme.primaryDark,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: AppTheme.accentGold,
            labelColor: AppTheme.accentGold,
            unselectedLabelColor: Colors.white60,
            labelStyle: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.bold,
            ),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Gun'),
              Tab(text: 'Pyro'),
              Tab(text: 'Fog'),
              Tab(text: 'Balloon'),
              Tab(text: 'Other'),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Gallery View (Directly in Column, no Expanded)
        _buildGalleryGrid(context, imageSets[_selectedIndex]),
      ],
    );
  }

  Widget _buildGalleryGrid(BuildContext context, List<String> images) {
    if (images.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Text('Coming Soon', style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // We don't need SingleChildScrollView here because the page itself scrolls.
      // But MasonryGridView needs primary: false or generic scroll disabled.
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: MediaQuery.of(context).size.width > 900
            ? 3
            : MediaQuery.of(context).size.width > 600
            ? 2
            : 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GalleryItem(
                imagePath: images[index],
                title: 'Effect ${index + 1}',
              )
              .animate()
              .fadeIn(delay: (index * 50).ms)
              .slideY(begin: 0.1, duration: 400.ms);
        },
      ),
    );
  }
}
