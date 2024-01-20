import 'package:flutter/material.dart';

import '../app_constants/app_constants.dart';
import 'app_colors.dart';
import 'assets/app_fonts_path.dart';

class AppTextStyle {
  static TextStyle poppinsMediumTheme = TextStyle(
    fontSize: AppConstants.widht / 30,
    height: 1,
    color: AppColors.titleTextColor,
    fontFamily: AppFontsPath.poppinsMedium,
  );
  static TextStyle poppinsRegularTheme = TextStyle(
    fontSize: AppConstants.widht / 34,
    height: 1,
    color: AppColors.hintTextColor,
    fontFamily: AppFontsPath.poppinsRegular,
  );
}
