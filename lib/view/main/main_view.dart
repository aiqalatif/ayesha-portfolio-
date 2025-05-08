import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/animations.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import '../../view model/responsive.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatefulWidget {
  const MainView({super.key, required this.pages});
  final List<Widget> pages;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _pageController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _pageController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() => _isVisible = true);
        _pageController.forward();
      }
    });

    // Listen to page changes
    controller.addListener(() {
      if (controller.page != null) {
        _pageController.reset();
        _pageController.forward();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _isVisible ? 1.0 : 0.0,
              child: const SizedBox(
                height: 80,
                child: TopNavigationBar(),
              ),
            ),
            if (Responsive.isLargeMobile(context))
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _isVisible ? 1.0 : 0.0,
                child: const Row(
                  children: [Spacer(), NavigationButtonList(), Spacer()],
                ),
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: widget.pages.map((page) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: child,
                        ),
                      );
                    },
                    child: page,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}








