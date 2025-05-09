import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xffbad6b5),
        child: Column(
          children: [
            const Spacer(flex: 2,),
           
            const Spacer(),
            Text('Ayesha Latif',style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: defaultPadding/4,),
            const Text('Flutter Developer & The Student of\nComputer Science Engineering',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                  color: primaryColor
              ),),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
