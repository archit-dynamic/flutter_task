import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_button.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class EventCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageUrl;
  final String title;
  final String description;
  final String backgroundImage;
  final Widget profilePictureRow;
  final VoidCallback onButtonPressed;
  final Color color;
  final double? imageHeight;
  final double? imageWidth;

  const EventCard({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.profilePictureRow,
    required this.onButtonPressed,
    required this.color,
    this.imageHeight,
    this.imageWidth,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          )),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12, right: 12, top: 16.0, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 224,
                  child: CustomText(
                    text: title,
                    size: 18,
                    maxLines: 2,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: description,
                  size: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 55,
            right: 10,
            child: profilePictureRow,
          ),
          Positioned(
            bottom: -3,
            right: -5,
            child: CustomButton(
              buttonText: "Sign up for Event",
              onClick: () {},
              borderWidth: 3,
              height: 56,
              textSize: 14,
              textWeight: FontWeight.w700,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              buttonColor: AppColors.buttonBlack,
            ),
          ),
        ],
      ),
    );
  }
}
