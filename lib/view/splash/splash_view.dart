import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/home/home.dart';
import 'package:flutter_portfolio/view/splash/componenets/animated_loading_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Animated background
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      accentColor2.withOpacity(0.2 * _glowAnimation.value),
                      accentColor1.withOpacity(0.2 * _glowAnimation.value),
                    ],
                  ),
                ),
              );
            },
          ),
          // Hexagon grid
          ...List.generate(6, (index) {
            return Positioned(
              top: 100.0 * (index + 1),
              left: 50.0 * (index + 1),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotateAnimation.value * (index + 1) * 0.2,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: accentColor2.withOpacity(0.1),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo container
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: accentColor2,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: accentColor2.withOpacity(0.3 * _glowAnimation.value),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Animated border
                            AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: accentColor2.withOpacity(0.5 * _glowAnimation.value),
                                      width: 3,
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Icon
                            const Center(
                              child: Icon(
                                Icons.code,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: defaultPadding * 2),
                // Text content
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Column(
                          children: [
                            const AnimatedLoadingText(),
                            const SizedBox(height: defaultPadding),
                            Text(
                              'Welcome to My Portfolio',
                              style: TextStyle(
                                color: accentColor2,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                shadows: [
                                  Shadow(
                                    color: accentColor2.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Text(
                              'Flutter Developer',
                              style: TextStyle(
                                color: accentColor2.withOpacity(0.8),
                                fontSize: 18,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
