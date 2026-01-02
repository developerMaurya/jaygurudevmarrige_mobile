import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryDark = Color(0xFF2b0a0a);
  static const Color accentGold = Color(0xFFd4af37);
  static const Color accentRose = Color(0xFFe6b0aa);
  static const Color accentSilver = Color(0xFFc0c0c0);
  static const Color textLight = Color(0xFFf8f9fa);
  static const Color footerDark = Color(0xFF0a0a1a);

  static LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4a0404), Color(0xFF8b0000), Color(0xFF3e1e1e)],
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryDark.withOpacity(0.95),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'PlayfairDisplay',
        fontSize: 20,
        color: accentGold,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: accentGold),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      titleLarge: GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      titleMedium: GoogleFonts.playfairDisplay(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textLight,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textLight.withOpacity(0.9),
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: primaryDark,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: accentGold,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    cardTheme: CardThemeData(
      color: Colors.white.withOpacity(0.05),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    iconTheme: IconThemeData(color: accentGold),
  );

  static TextStyle sectionTitleStyle(BuildContext context) {
    return GoogleFonts.playfairDisplay(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textLight,
    );
  }

  static BoxDecoration serviceCardDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: accentGold.withOpacity(0.1)),
    );
  }

  static BoxDecoration aboutContentDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.03),
      borderRadius: BorderRadius.circular(10),
      border: Border(left: BorderSide(color: accentGold, width: 4)),
    );
  }
}
