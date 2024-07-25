import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class FollowCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String image;
  final String name;
  final String description;

  const FollowCard(
      {super.key,
      this.width,
      this.height,
      required this.image,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFDCDCDC),
                width: 1,
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 8),
              CustomText(
                text: name,
                color: AppColors.bodyBlack,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: description,
                textAlign: TextAlign.center,
                color: AppColors.buttonGrey,
                size: 12,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  //write the logic to follow here
                  //call an api
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bodyBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the radius as needed
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 33, vertical: 6),
                ),
                child: const CustomText(
                  text: 'Follow',
                  color: AppColors.white,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: IconButton(
            icon: const Icon(
              Icons.close,
              size: 12,
            ),
            onPressed: () {
              //logic to remove the card from the list here
              //call an api to update in the server
            },
          ),
        ),
      ],
    );
  }
}
