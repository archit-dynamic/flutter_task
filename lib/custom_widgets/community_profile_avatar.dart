import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class CommunityProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onAddButtonPressed;

  const CommunityProfileAvatar({
    super.key,
    required this.imageUrl,
    required this.onAddButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF16C083), Color(0xFFB2C016)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              width: 3,
              color: Colors.transparent,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 45,
          ),
        ),
        // Add Button
        Positioned(
          bottom: 5,
          right: 5,
          child: GestureDetector(
            onTap: onAddButtonPressed,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryGreen,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
