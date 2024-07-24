import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_button.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';
import 'package:singhania_edu_flutter_task/utils/app_images.dart';

class QuestionCard extends StatefulWidget {
  final int upvoteCount;
  final int answerCount;
  final String name;
  final String description;
  final String question;
  final String answer;
  final String image;
  final String? tag;
  final bool isAnswered;

  const QuestionCard(
      {super.key,
      required this.upvoteCount,
      required this.answerCount,
      required this.name,
      required this.description,
      required this.question,
      required this.answer,
      required this.image,
      this.tag,
      required this.isAnswered});

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 16,
                color: AppColors.shadow.withOpacity(0.08)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.image),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: widget.name,
                          ),
                          if (widget.tag != null)
                            const SizedBox(
                              width: 9,
                            ),
                          if (widget.tag != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7AD4B3),
                                      Color(0xFF029661),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CustomText(
                                text: widget.tag,
                                size: 8,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                        ],
                      ),
                      CustomText(
                        text: widget.description,
                        maxLines: 2,
                        color: AppColors.headingGrey,
                        fontWeight: FontWeight.w400,
                        size: 12,
                      ),
                    ],
                  ),
                ),
                if (widget.isAnswered)
                  const CustomText(
                    text: "answered",
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.w500,
                    size: 12,
                  ),
              ],
            ),
            const SizedBox(height: 16),
            CustomText(
              text: widget.question,
              maxLines: 2,
              color: AppColors.bodyBlack,
              fontWeight: FontWeight.w700,
              size: 16,
            ),
            const SizedBox(height: 8),
            LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.answer,
                      maxLines: isExpanded ? null : 2,
                      overflow: isExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      color: AppColors.bodyBlack,
                      fontWeight: FontWeight.w400,
                      size: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: CustomText(
                        text: isExpanded ? 'View less...' : 'View more...',
                        color: AppColors.buttonGrey,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomButton(
                      icon: SvgPicture.asset(AppImages.arrowUp),
                      buttonText: "${widget.upvoteCount} upvotes",
                      onClick: () {},
                      borderWidth: 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      buttonColor: AppColors.buttonGreyLight,
                      textSize: 12,
                      textWeight: FontWeight.w400,
                      textColor: AppColors.buttonGrey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.buttonGreyLight,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: SvgPicture.asset(
                        AppImages.arrowDown,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  icon: SvgPicture.asset(AppImages.speechBubble),
                  buttonText: "${widget.answerCount} Answers",
                  onClick: () {},
                  borderWidth: 3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  buttonColor: AppColors.buttonGreyLight,
                  textSize: 12,
                  textWeight: FontWeight.w400,
                  textColor: AppColors.buttonGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
