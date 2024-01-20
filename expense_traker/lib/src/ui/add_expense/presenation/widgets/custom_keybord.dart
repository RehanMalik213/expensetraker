import 'package:flutter/material.dart';

import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/resouces/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/clickable_widget.dart';

class CustomKeyBoard extends StatelessWidget {
  final String value;
  final Function() onclick;

  const CustomKeyBoard({super.key, required this.value, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return ClickableWiget(
      onPress: onclick,
      child: SizedBox(
        width: value == 'Delete'
            ? (AppConstants.widht / 2.5) / 1.5
            : (AppConstants.widht / 2.5) / 3,
        height: (AppConstants.widht / 2.5) / 3,
        child: Card(
          elevation: 3,
          color: value == 'Delete' ? Colors.red : AppColors.whiteColor,
          child: Center(
            child: AppText(
              text: value,
              textColor: value == 'Delete'
                  ? AppColors.whiteColor
                  : AppColors.hintTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
