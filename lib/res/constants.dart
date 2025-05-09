import 'package:flutter/material.dart';

// Primary Colors
const primaryColor = Color(0xFF1B4D2E); // Darker forest green
const secondaryColor = Color(0xFF2D5A3F); // Dark sage green
const darkColor = Color(0xFF1B4D2E); // Darker forest green
const bodyTextColor = Color(0xFF0A2E1B); // Very dark green for text
const bgColor = Color(0xFF1B4D2E); // Light mint

// Accent Colors
const accentColor1 = Color(0xFF3E7C4B); // Medium forest green
const accentColor2 = Color(0xFF2D5A3F); // Dark sage green
const accentColor3 = Color(0xFF1B4D2E); // Darker forest green

// Gradient Colors
const gradientStart = Color(0xFF1B4D2E);
const gradientEnd = Color(0xFF2D5A3F);

// Text Colors
const headingColor = Color(0xFF0A2E1B); // Very dark green for headings
const subheadingColor = Color(0xFF1B4D2E); // Darker forest green for subheadings

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
