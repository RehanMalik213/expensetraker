import 'package:expense_traker/core/extenssions/app_extenssions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/resouces/app_colors.dart';
import '../../../../../core/resouces/app_text_style.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/circle_widget.dart';

class CardRow extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String dateTime;
  final String expenseAmount;
  final String expense;

  const CardRow(
      {super.key,
      required this.index,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.expenseAmount,
      required this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleWidgets(
              height: 50,
              bgColor: AppColors.borderColor,
              widht: 50,
              widget: Icon(
                color: expense == 'Income' ? Colors.green : Colors.red,
                expense == 'Income'
                    ? Icons.arrow_forward_rounded
                    : Icons.arrow_back_rounded,
              ),
            ),
          ),
          5.width,
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: title),
                4.height,
                AppText(
                  text: description,
                  textStyle: AppTextStyle.poppinsRegularTheme.copyWith(
                    color: AppColors.hintTextColor,
                  ),
                ),
                3.height,
                AppText(
                  text: dateTime,
                  textStyle: AppTextStyle.poppinsRegularTheme.copyWith(
                    color: AppColors.borderColor,
                    fontSize: AppConstants.widht / 40,
                  ),
                )
              ],
            ),
          ),
          10.width,
          Expanded(flex: 1, child: AppText(text: expenseAmount))
        ],
      ),
    );
  }
}
