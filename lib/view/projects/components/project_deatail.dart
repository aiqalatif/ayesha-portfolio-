import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_link.dart';

import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var project = projectList[index];
    var size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📸 Project Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                project.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
        
            const SizedBox(height: defaultPadding / 1.5),
        
            // 📌 Project Name
            Text(
              project.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFFBAD6B5),
                    fontWeight: FontWeight.bold,
                  ),
            ),
        
            const SizedBox(height: defaultPadding / 4),
        
            // 📝 Project Description
            Text(
              project.description,
              style: const TextStyle(
                color: const Color(0xFFBAD6B5),
                height: 1.4,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
        
            
        
            // 🔗 Project Link Button
            Align(
              alignment: Alignment.bottomRight,
              child: ProjectLinks(index: index),
            ),
          ],
        ),
      ),
    );
  }
}
