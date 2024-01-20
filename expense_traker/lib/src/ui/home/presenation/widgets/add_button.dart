import 'package:expense_traker/core/widgets/clickable_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/resouces/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class AddButton extends StatelessWidget {
  final Function() onClick;
  const AddButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ClickableWiget(
      onPress: onClick,
      child: SizedBox(
        height: 35,
        width: AppConstants.widht / 5,
        child: Card(
          elevation: 5,
          color: AppColors.buttonColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.whiteColor,
                size: 20,
              ),
              AppText(
                text: 'Add',
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
