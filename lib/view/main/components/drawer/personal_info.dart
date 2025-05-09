import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding/2,),
        AreaInfoText(title: 'Contact', text: '03039904026'),
        AreaInfoText(title: 'Email', text: 'ayeshalatif55566@gmail.com'),
        AreaInfoText(title: 'LinkedIn', text: 'Ayesha-Latif'),
        AreaInfoText(title: 'Github', text: 'Ayesha-Lati'),
        SizedBox(
          height: defaultPadding,
        ),
        Text('Skills', style: TextStyle(color: headingColor)),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
