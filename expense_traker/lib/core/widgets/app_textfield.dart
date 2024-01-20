import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../app_constants/app_constants.dart';
import '../resouces/app_colors.dart';
import '../resouces/app_text_style.dart';
import 'app_text.dart';

class AppTextFeild extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function(String value)? onChanged;
  final Function()? onTap;
  final RxString errorMsg;
  final String mask;
  final RegExp regExPattren;
  final Color? borderColor;
  final String label;
  final String hint;
  final bool? autoFocus;
  final Color? textColor;
  final bool? readOnly;
  final int? texeLenght;
  final int? mexLines;

  const AppTextFeild({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    this.onChanged,
    required this.errorMsg,
    required this.mask,
    required this.regExPattren,
    this.borderColor,
    required this.label,
    required this.hint,
    this.textColor,
    this.readOnly,
    this.autoFocus,
    this.texeLenght,
    this.mexLines,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              onTap: onTap,
              maxLines: mexLines,
              autofocus: autoFocus ?? false,
              readOnly: readOnly ?? false,
              style: AppTextStyle.poppinsMediumTheme
                  .copyWith(color: textColor ?? AppColors.titleTextColor),
              controller: textEditingController,
              onChanged: onChanged,
              inputFormatters: [
                MaskTextInputFormatter(mask: mask, filter: {"#": regExPattren}),
                LengthLimitingTextInputFormatter(texeLenght),
              ],
              cursorRadius: const Radius.circular(100),
              keyboardType: textInputType,
              cursorColor: AppColors.titleTextColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.whiteColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                hintText: hint,
                hintStyle: AppTextStyle.poppinsMediumTheme
                    .copyWith(color: AppColors.hintTextColor),
                label: AppText(
                  textStyle: AppTextStyle.poppinsMediumTheme.copyWith(
                    color: textColor ?? AppColors.hintTextColor,
                  ),
                  text: label,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: borderColor ?? AppColors.whiteColor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: AppColors.whiteColor, width: 1.5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 15),
              child: AppText(
                text: errorMsg.value,
                textStyle: AppTextStyle.poppinsRegularTheme.copyWith(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
