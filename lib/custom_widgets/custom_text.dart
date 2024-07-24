import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? lineHeightToFontSizeRatio;
  final FontStyle? fontStyle;

  const CustomText(
      {super.key,
      @required this.text,
      this.size,
      this.color,
      this.textAlign,
      this.maxLines,
      this.lineHeightToFontSizeRatio,
      this.fontWeight = FontWeight.w500,
      this.overflow = TextOverflow.ellipsis,
      this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          height: lineHeightToFontSizeRatio,
          color: color,
          fontSize: size,
          fontStyle: fontStyle,
          fontFamily: "Poppins",
          fontWeight: fontWeight,
          decoration: TextDecoration.none),
    );
  }
}
