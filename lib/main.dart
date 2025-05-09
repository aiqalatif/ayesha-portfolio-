import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/splash/splash_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: accentColor2,
          surface: secondaryColor,
          background: bgColor,
          error: accentColor3,
        ),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
            .apply(
              bodyColor: bodyTextColor,
              displayColor: headingColor,
            )
            .copyWith(
              displayLarge: const TextStyle(
                color: headingColor,
                fontWeight: FontWeight.w800,
                fontSize: 48,
                letterSpacing: -1.5,
              ),
              displayMedium: const TextStyle(
                color: headingColor,
                fontWeight: FontWeight.w700,
                fontSize: 36,
                letterSpacing: -1,
              ),
              displaySmall: const TextStyle(
                color: headingColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: -0.5,
              ),
              bodyLarge: const TextStyle(
                color: bodyTextColor,
                fontSize: 18,
                height: 1.6,
                letterSpacing: 0.15,
              ),
              bodyMedium: const TextStyle(
                color: subheadingColor,
                fontSize: 16,
                height: 1.5,
                letterSpacing: 0.25,
              ),
            ),
        cardTheme: CardTheme(
          color: secondaryColor,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
          ),
          shadowColor: Colors.black.withOpacity(0.3),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor2,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: smallPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
            elevation: 4,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: const BorderSide(color: accentColor2, width: 2),
          ),
          contentPadding: const EdgeInsets.all(defaultPadding),
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
        iconTheme: const IconThemeData(
          color: accentColor2,
          size: 24,
        ),
      ),
      home: const SplashView(),
    );
  }
}


