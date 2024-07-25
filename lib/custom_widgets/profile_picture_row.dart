import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class ProfilePictureRow extends StatelessWidget {
  final List<String> profilePictures;

  const ProfilePictureRow({super.key, required this.profilePictures});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildProfilePictures(),
    );
  }

  List<Widget> _buildProfilePictures() {
    List<Widget> widgets = [];
    int displayCount = profilePictures.length > 3 ? 3 : profilePictures.length;

    for (int i = 0; i < displayCount; i++) {
      widgets.add(
        Positioned(
          left: i * 18.0, // Overlap effect
          child: CircleAvatar(
            backgroundImage: AssetImage(profilePictures[i]),
            radius: 11,
          ),
        ),
      );
    }

    if (profilePictures.length > 3) {
      widgets.add(
        Positioned(
          left: displayCount * 18.0,
          child: CircleAvatar(
            radius: 11,
            child: CustomText(
              text: '+${profilePictures.length - 3}',
              size: 8,
              fontWeight: FontWeight.w700,
              color: AppColors.bodyBlack,
            ),
          ),
        ),
      );
    }

    return [
      SizedBox(
        width: 66.0 + (profilePictures.length > 3 ? 11.0 : 0.0),
        height: 40.0,
        child: Stack(
          children: widgets,
        ),
      ),
    ];
  }
}
