import 'package:expense_traker/core/widgets/clickable_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resouces/app_colors.dart';

class DateTimeBox extends StatelessWidget {
  final Function() onClick;
  final IconData icon;
  const DateTimeBox({super.key, required this.onClick, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClickableWiget(
      onPress: onClick,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Icon(
          icon,
          color: AppColors.hintTextColor,
        ),
      ),
    );
  }
}
