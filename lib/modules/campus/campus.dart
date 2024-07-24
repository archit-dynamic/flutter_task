import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/channel_card.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_button.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/event_card.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/follow_card.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/profile_picture_row.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/question_card.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';
import 'package:singhania_edu_flutter_task/utils/app_images.dart';

class CampusPage extends StatefulWidget {
  const CampusPage({super.key});

  @override
  State<CampusPage> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage> {
  final List<String> audioRoomsList = [
    "Career",
    "Projects",
    "UI/UX",
    "Branding"
  ];

  String selectedAudioRoom = "Career";

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
                  text: "Audio Rooms",
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 9, left: 9),
            child: SizedBox(
              height: 38,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, i) => const SizedBox(
                  width: 10,
                ),
                itemCount: audioRoomsList.length,
                itemBuilder: (context, index) {
                  return CustomButton(
                    onClick: () {
                      setState(() {
                        selectedAudioRoom = audioRoomsList[index];
                      });
                    },
                    buttonText: "#${audioRoomsList[index]}",
                    height: 38,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
                    buttonColor: selectedAudioRoom == audioRoomsList[index]
                        ? AppColors.primaryGreen.withOpacity(0.34)
                        : AppColors.white,
                    borderColor: AppColors.primaryGreen.withOpacity(0.34),
                    borderWidth:
                        selectedAudioRoom == audioRoomsList[index] ? 0 : 2,
                    textColor: AppColors.primaryGreen,
                    textSize: 14,
                    textWeight: FontWeight.w500,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChannelCard(
                    imageUrl: AppImages.channel1,
                    color: AppColors.primaryGreen,
                    tag: 'Tag',
                    title: 'Card Title',
                    description: 'Card Description',
                    height: 185,
                    width: 247,
                    imageWidth: 70,
                    profilePictureRow: ProfilePictureRow(
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
                  const SizedBox(
                    width: 14,
                  ),
                  ChannelCard(
                    imageUrl: AppImages.channel2,
                    color: AppColors.channelBlue,
                    tag: 'Tag',
                    title: 'Card Title',
                    description: 'Card Description',
                    height: 185,
                    width: 247,
                    imageHeight: 180,
                    imageWidth: 100,
                    profilePictureRow: ProfilePictureRow(
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
                  const SizedBox(
                    width: 9,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: QuestionCard(
              image: AppImages.profile4,
              name: "Dia Mohapatra",
              description:
                  "Student @AAM | Learning about finance opportunities and se...",
              question:
                  "What is the simplest investment advice you can give me?",
              answer:
                  "Just recently got into investing, looking for the best stocks to invest in for a long Just recently got into investing, looking for the best stocks to invest in for a long",
              answerCount: 5,
              upvoteCount: 12,
              isAnswered: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: QuestionCard(
              image: AppImages.profile5,
              name: "Dia Mohapatra",
              description:
                  "Student @AAM | Learning about finance opportunities and se...",
              question:
                  "How do I kickstart my career in 2023 with all this AI noise?",
              answer:
                  "Just recently got into investing, looking for the best stocks to invest in Just recently got into investing, looking for the best stocks to invest in",
              answerCount: 5,
              upvoteCount: 12,
              tag: "Mentor",
              isAnswered: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: EventCard(
              imageUrl: AppImages.channel2,
              color: AppColors.channelBlue,
              backgroundImage: AppImages.event1,
              title: 'CKey to making tough decisions ',
              description: 'Hackathon Event . 12 Dec',
              height: 406,
              imageHeight: 180,
              imageWidth: 100,
              profilePictureRow: ProfilePictureRow(
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
          Container(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                    color: AppColors.shadow.withOpacity(0.08)),
              ],
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "People you might know",
                        size: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.bodyBlack,
                      ),
                      CustomText(
                        text: "See All",
                        size: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryGreen,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FollowCard(
                        image: AppImages.profile1,
                        name: "Raj Vishwa",
                        description: "Govt. College of...",
                        height: 191,
                        width: 144,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FollowCard(
                        image: AppImages.profile2,
                        name: "Ria Sen",
                        description: "Govt. College of...",
                        height: 191,
                        width: 144,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      FollowCard(
                        image: AppImages.profile3,
                        name: "Raj Vishwa",
                        description: "Govt. College of...",
                        height: 191,
                        width: 144,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
