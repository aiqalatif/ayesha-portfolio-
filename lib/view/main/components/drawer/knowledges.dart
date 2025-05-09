import 'package:flutter/material.dart';
import '../../../../res/constants.dart';
import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Knowledge', style: TextStyle(color: headingColor)),
        ),
        KnowledgeText(knowledge: 'Flutter & Dart'),
        KnowledgeText(knowledge: 'Backend Development (Node.js)'),
        KnowledgeText(knowledge: 'Version Control (Git & GitHub)'),
      ],
    );
  }
}
