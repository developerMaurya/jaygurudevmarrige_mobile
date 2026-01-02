import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/gallery_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const WeddingEffectsApp());
}

class WeddingEffectsApp extends StatelessWidget {
  const WeddingEffectsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaygurudev Marriage Effect',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        onNavigate: (index) {
          setState(() {
            _currentIndex = index;
          });
          _scrollToTop();
        },
      ),
      ServicesPage(),
      GalleryPage(),
      AboutPage(),
      ContactPage(),
    ];
  }

  final List<String> _appBarTitles = [
    'Jaygurudev Marriage Effect',
    'Our Services',
    'Gallery',
    'About Us',
    'Contact Us',
  ];

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(FontAwesomeIcons.star, color: AppTheme.accentGold, size: 20),
            SizedBox(width: 10),
            Text(
              _appBarTitles[_currentIndex],
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.accentGold,
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.primaryDark.withOpacity(0.95),
        elevation: 0,
        centerTitle: false,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            // Handle scroll effects here
          }
          return false;
        },
        child: ListView(
          controller: _scrollController,
          children: [
            _pages[_currentIndex],
            Footer(
              onNavigate: (index) {
                if (index == 0) {
                  // Home: Switch tab and scroll to top
                  setState(() {
                    _currentIndex = 0;
                  });
                  _scrollToTop();
                } else {
                  // Others: Navigate to new page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        backgroundColor: AppTheme.primaryDark,
                        appBar: AppBar(
                          title: Text(
                            _appBarTitles[index],
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.accentGold,
                            ),
                          ),
                          iconTheme: IconThemeData(color: AppTheme.accentGold),
                          backgroundColor: AppTheme.primaryDark.withOpacity(
                            0.95,
                          ),
                        ),
                        body: _pages[index],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryDark.withOpacity(0.95),
          border: Border(
            top: BorderSide(color: AppTheme.accentGold.withOpacity(0.2)),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _scrollToTop();
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.accentGold,
          unselectedItemColor: AppTheme.textLight.withOpacity(0.7),
          selectedLabelStyle: GoogleFonts.montserrat(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.montserrat(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work, size: 24),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library, size: 24),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info, size: 24),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone, size: 24),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
