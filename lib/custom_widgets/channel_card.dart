import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_button.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class ChannelCard extends StatelessWidget {
  final double? width;
  final double? height;
  final String imageUrl;
  final String tag;
  final String title;
  final String description;
  final Widget profilePictureRow;
  final VoidCallback onButtonPressed;
  final Color color;
  final double? imageHeight;
  final double? imageWidth;

  const ChannelCard({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.description,
    required this.profilePictureRow,
    required this.onButtonPressed,
    required this.color,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12, right: 12, top: 16.0, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.live,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: CustomText(
                        text: tag,
                        color: AppColors.white,
                        size: 10,
                        lineHeightToFontSizeRatio: 16 / 10,
                      ),
                    ),
                    const Spacer(),
                    profilePictureRow,
                  ],
                ),
                const Spacer(),
                CustomText(
                  text: title,
                  size: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
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
            bottom: -20,
            right: -10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                width: imageWidth ?? 67,
                height: imageHeight ?? 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: -3,
            right: -10,
            child: CustomButton(
              buttonText: "Join",
              onClick: () {},
              borderWidth: 3,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              buttonColor: AppColors.buttonBlack,
            ),
          ),
        ],
      ),
    );
  }
}
