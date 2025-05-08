import 'package:flutter/material.dart';

// Primary Colors
const primaryColor = Color(0xFF2D3436); // Deep charcoal
const secondaryColor = Color(0xFF636E72); // Muted gray
const darkColor = Color(0xFF1E1E1E); // Rich black
const bodyTextColor = Color(0xFFDFE6E9); // Soft white
const bgColor = Color(0xFF0A0A0A); // Pure black

// Accent Colors
const accentColor1 = Color(0xFF00B894); // Mint green
const accentColor2 = Color(0xFF0984E3); // Ocean blue
const accentColor3 = Color(0xFF6C5CE7); // Royal purple

// Gradient Colors
const gradientStart = Color(0xFF2D3436);
const gradientEnd = Color(0xFF000000);

// Text Colors
const headingColor = Colors.white;
const subheadingColor = Color(0xFFB2BEC3);

// Spacing
const defaultPadding = 24.0;
const smallPadding = 12.0;
const largePadding = 36.0;

// Border Radius
const defaultBorderRadius = 16.0;
const smallBorderRadius = 8.0;
const largeBorderRadius = 24.0;

// Shadows
const defaultShadow = BoxShadow(
  color: Color(0x1A000000),
  blurRadius: 15,
  offset: Offset(0, 5),
);

// Gradients
const primaryGradient = LinearGradient(
  colors: [gradientStart, gradientEnd],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// Animation Durations
const defaultDuration = Duration(milliseconds: 300);
const fastDuration = Duration(milliseconds: 200);
const slowDuration = Duration(milliseconds: 500);
