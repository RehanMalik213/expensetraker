import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/resouces/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class DateTimeTextFeild extends StatelessWidget {
  final RxString dateTime;
  const DateTimeTextFeild({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: AppConstants.bodyPadding),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Obx(
            () => AppText(
              text: dateTime.value,
              textColor: AppColors.hintTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
