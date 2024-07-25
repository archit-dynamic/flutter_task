import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/community_profile_avatar.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class CommunityProfile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onAddButtonPressed;

  const CommunityProfile(
      {super.key,
      required this.imageUrl,
      required this.onAddButtonPressed,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommunityProfileAvatar(
            imageUrl: imageUrl,
            onAddButtonPressed: onAddButtonPressed,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            text: title,
            size: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            // maxLines: 2,
          ),
          CustomText(
            text: description,
            size: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.buttonGrey,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
