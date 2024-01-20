import 'package:expense_traker/core/resouces/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_constants/app_constants.dart';
import '../resouces/app_colors.dart';
import 'app_text.dart';

class AppDropdown extends StatelessWidget {
  final List<String> dropdownOptions;
  final Function(List<dynamic> selectedItems) onChange;
  final Color? textColor;
  final String label;
  final Color? borderColor;
  final RxString selectedItem;
  final String hint;
  const AppDropdown(
      {super.key,
      required this.dropdownOptions,
      required this.onChange,
      this.textColor,
      required this.label,
      this.borderColor,
      required this.selectedItem,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
      height: 40,
      child: DropdownButtonFormField<String>(
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.hintTextColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          hintStyle: AppTextStyle.poppinsMediumTheme
              .copyWith(color: AppColors.hintTextColor),
          label: AppText(
            textStyle: AppTextStyle.poppinsMediumTheme.copyWith(
              color: textColor ?? AppColors.hintTextColor,
            ),
            text: label,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.whiteColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.whiteColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.whiteColor, width: 1.5),
          ),
        ),
        isExpanded: true,
        value: selectedItem.value,
        onChanged: (String? newValue) {
          selectedItem.value = newValue!;
        },
        items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: AppText(
              text: value,
              textColor: AppColors.titleTextColor,
            ),
          );
        }).toList(),
      ),
    );
  }
}
