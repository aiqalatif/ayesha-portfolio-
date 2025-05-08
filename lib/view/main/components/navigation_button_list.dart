import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/res/constants.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationTextButton(
          onTap: () {
            controller.animateToPage(
              0,
              duration: defaultDuration,
              curve: Curves.easeInOut,
            );
          },
          text: 'Home',
        ),
        const SizedBox(width: defaultPadding),
        NavigationTextButton(
          onTap: () {
            controller.animateToPage(
              1,
              duration: defaultDuration,
              curve: Curves.easeInOut,
            );
          },
          text: 'Projects',
        ),
      ],
    );
  }
}