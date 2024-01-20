import 'package:flutter/material.dart';
import '../resouces/app_colors.dart';
import '../resouces/app_text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final FontWeight? fontWeight;
  final TextOverflow? overFlow;
  final int? maxLine;
  const AppText(
      {super.key,
      required this.text,
      this.textStyle,
      this.textDecoration,
      this.textColor,
      this.textAlign,
      this.fontWeight,
      this.overFlow,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyle.poppinsMediumTheme.copyWith(
            decoration: textDecoration ?? TextDecoration.none,
            color: textColor ?? AppColors.titleTextColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overFlow,
      maxLines: maxLine,
    );
  }
}
