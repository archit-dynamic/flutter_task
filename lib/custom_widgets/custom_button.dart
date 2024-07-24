import 'package:flutter/material.dart';
import 'package:singhania_edu_flutter_task/custom_widgets/custom_text.dart';
import 'package:singhania_edu_flutter_task/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final String buttonText;
  final Color buttonColor;
  final Widget? icon;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final double? textSize;
  final FontWeight? textWeight;

  const CustomButton(
      {super.key,
      required this.onClick,
      required this.buttonText,
      this.icon,
      this.buttonColor = AppColors.primaryGreen,
      this.height = 45,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      this.width,
      this.borderColor,
      this.borderWidth,
      this.textColor,
      this.textSize,
      this.textWeight});

  @override
  Widget build(BuildContext context) {
    bool needIcon = icon != null;
    return SelectionContainer.disabled(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(1000.0),
              border: Border.all(
                  color: borderColor ?? AppColors.white,
                  width: borderWidth ?? 0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (needIcon) icon!,
              if (needIcon) const SizedBox(width: 8.0),
              CustomText(
                  fontWeight: textWeight ?? FontWeight.bold,
                  size: textSize ?? 16.0,
                  text: buttonText,
                  color: textColor ?? AppColors.white),
            ],
          ),
        ),
      ),
    );
  }
}
