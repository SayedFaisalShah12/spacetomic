import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpacetomicTextTheme {
  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.orbitron(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white), // Large Titles
    displayMedium: GoogleFonts.orbitron(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
    displaySmall: GoogleFonts.orbitron(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),

    headlineLarge: GoogleFonts.orbitron(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white), // Section Titles
    headlineMedium: GoogleFonts.orbitron(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
    headlineSmall: GoogleFonts.orbitron(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white70),

    titleLarge: GoogleFonts.orbitron(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white), // Subtitle / AppBar
    titleMedium: GoogleFonts.orbitron(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
    titleSmall: GoogleFonts.orbitron(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white60),

    bodyLarge: GoogleFonts.orbitron(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white), // Main Body Text
    bodyMedium: GoogleFonts.orbitron(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: GoogleFonts.orbitron(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white54),

    labelLarge: GoogleFonts.orbitron(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Buttons
    labelMedium: GoogleFonts.orbitron(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
    labelSmall: GoogleFonts.orbitron(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white60),
  );
}

