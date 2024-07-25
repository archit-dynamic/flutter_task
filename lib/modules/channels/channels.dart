import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/channel_card.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/community_profile.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/profile_picture_row.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';
import 'package:singhania_edu_flutter_task/utils/app_images.dart';

class ChannelsPage extends StatelessWidget {
  ChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Browse Community",
                  size: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                CustomText(
                  text: "View All",
                  size: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.buttonGrey,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CommunityProfile(
                    imageUrl: AppImages.community1,
                    onAddButtonPressed: () {},
                    title: "Papercut",
                    description: "Interview questions",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CommunityProfile(
                    imageUrl: AppImages.community2,
                    onAddButtonPressed: () {},
                    title: "Mastermind",
                    description: "Mind of a CEO",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CommunityProfile(
                    imageUrl: AppImages.community3,
                    onAddButtonPressed: () {},
                    title: "Projex",
                    description: "Prepare for projects",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CommunityProfile(
                    imageUrl: AppImages.community4,
                    onAddButtonPressed: () {},
                    title: "Lionel",
                    description: "Interview questions",
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Recommended",
                  size: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                CustomText(
                  text: "View All",
                  size: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.buttonGrey,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11.0, right: 14),
            child: ChannelCard(
              imageUrl: AppImages.channel1,
              color: AppColors.primaryGreen,
              tag: 'Free',
              title: 'Card Title',
              description: 'Card Description',
              tagColor: AppColors.tagGreen,
              tagTextColor: AppColors.headingGrey,
              buttonText: "Join Channel",
              buttonHeight: 56,
              height: 185,
              // width: 247,
              imageWidth: 70,

              buttonPadding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              profilePictureRow: ProfilePictureRow(
                length: 45,
                profilePictures: [
                  AppImages.profile1,
                  AppImages.profile2,
                  AppImages.profile3,
                  AppImages.profile4,
                ],
              ),
              onButtonPressed: () {
                // Handle button press
                debugPrint('Button pressed');
              },
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11.0, right: 14),
            child: ChannelCard(
              imageUrl: AppImages.channel2,
              color: Colors.black,
              tag: 'Pro',
              title: 'Card Title',
              description: 'Card Description',
              height: 185,
              tagColorGradient: const LinearGradient(
                  colors: [Color(0xFF3350ED), Color(0xFF9611FF)]),
              // width: 247,
              imageHeight: 180,
              imageWidth: 100,
              profilePictureRow: ProfilePictureRow(
                length: 45,
                profilePictures: [
                  AppImages.profile1,
                  AppImages.profile2,
                  AppImages.profile3,
                  AppImages.profile4,
                ],
              ),
              onButtonPressed: () {
                // Handle button press
                debugPrint('Button pressed');
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
