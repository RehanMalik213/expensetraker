import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

import '../app_constants/app_constants.dart';
import '../resouces/app_colors.dart';
import '../resouces/app_text_style.dart';
import '../resouces/assets/app_fonts_path.dart';

class Utills {
  Utills._();
  static Future<DateTime?> getDate(context) async {
    var date = await showRoundedDatePicker(
      context: context,
      firstDate: DateTime(1980),
      theme: ThemeData.dark(useMaterial3: true),
      fontFamily: AppFontsPath.poppinsMedium,
      height: AppConstants.height / 3,
      styleYearPicker: MaterialRoundedYearPickerStyle(
          textStyleYearSelected: AppTextStyle.poppinsRegularTheme.copyWith(
        color: AppColors.titleTextColor,
      )),
      styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundHeader: AppColors.titleTextColor,
        textStyleCurrentDayOnCalendar: AppTextStyle.poppinsMediumTheme.copyWith(
          color: AppColors.borderColor,
        ),
        textStyleDayHeader: AppTextStyle.poppinsMediumTheme.copyWith(
          color: AppColors.borderColor,
        ),
        decorationDateSelected: BoxDecoration(
          color: AppColors.titleTextColor,
          shape: BoxShape.circle,
        ),
        textStyleButtonNegative: AppTextStyle.poppinsMediumTheme.copyWith(
          color: AppColors.whiteColor,
        ),
        textStyleButtonPositive: AppTextStyle.poppinsMediumTheme.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
    return date;
  }

  static Future<TimeOfDay?> getTime(context) async {
    var time = await showRoundedTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      theme: ThemeData.dark(useMaterial3: true),
      fontFamily: AppFontsPath.poppinsMedium,
    );
    return time;
  }
}
