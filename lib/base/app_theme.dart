import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The [AppTheme] class provides a predefined  themes for the application.
/// I am only using it for text styles
class AppTheme {
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          displayMedium: GoogleFonts.inter(
            textStyle: const TextStyle(color: Colors.black54),
          ),
        ),
      );
}
