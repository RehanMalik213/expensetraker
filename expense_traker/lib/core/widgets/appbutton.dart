import '../app_constants/app_constants.dart';
import '../resouces/app_colors.dart';
import '../resouces/app_text_style.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final double? height;
  final Color? borderColr;

  final Function() onClick;

  const AppButton(
      {super.key,
      required this.text,
      this.textColor,
      this.bgColor,
      required this.onClick,
      this.height,
      this.borderColr});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.widht / 2.5,
      child: MaterialButton(
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        shape: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          borderSide: BorderSide(color: borderColr ?? Colors.transparent),
        ),
        color: bgColor ?? Colors.red,
        height: height ?? 35,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        // minWidth: double.infinity,
        onPressed: onClick,
        child: AppText(
          text: text,
          textStyle: AppTextStyle.poppinsMediumTheme.copyWith(
            color: textColor ?? AppColors.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
