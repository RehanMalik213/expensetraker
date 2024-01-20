import 'package:expense_traker/core/extenssions/app_extenssions.dart';
import 'package:expense_traker/core/resouces/app_text_style.dart';
import 'package:expense_traker/core/utills/utills.dart';
import 'package:expense_traker/core/widgets/app_dropdown.dart';
import 'package:expense_traker/src/ui/add_expense/presenation/widgets/custom_keybord.dart';
import 'package:expense_traker/src/ui/add_expense/presenation/widgets/date_time_box.dart';
import 'package:expense_traker/src/ui/add_expense/presenation/widgets/date_time_textfeld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/resouces/app_colors.dart';
import '../../../../../core/widgets/app_textfield.dart';
import '../../controller/add_expense_screen_controller.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});
  final controller = Get.find<AddExpenseScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.borderColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          width: AppConstants.widht,
          child: Column(
            children: [
              AppTextFeild(
                textEditingController: controller.expenseTitleController,
                textInputType: TextInputType.text,
                texeLenght: 30,
                errorMsg: controller.expensetitleErrorMsg,
                mask: '',
                regExPattren: RegExp(r'[A-Za-z ]{3}'),
                label: 'Title',
                hint: 'Title',
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (RegExp(r'[A-Za-z ]{2}').hasMatch(value)) {
                      controller.expensetitleErrorMsg.value = '';
                    } else {
                      controller.expensetitleErrorMsg.value =
                          'Enter valid Title';
                    }
                  } else {
                    controller.expensetitleErrorMsg.value = '';
                  }
                },
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
                child: TextField(
                  maxLines: AppConstants.height ~/ 70,
                  style: AppTextStyle.poppinsMediumTheme
                      .copyWith(color: AppColors.titleTextColor),
                  controller: controller.expenseDescriptionController,
                  cursorColor: AppColors.titleTextColor,
                  inputFormatters: [
                    ///TextFeildTexeLimit////
                    LengthLimitingTextInputFormatter(100),
                  ],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.borderColor),
                    ),
                    hintText: 'Description',
                    hintStyle: AppTextStyle.poppinsMediumTheme
                        .copyWith(color: AppColors.hintTextColor),
                  ),
                ),
              ),
              10.height,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
                child: Row(
                  children: [
                    DateTimeBox(
                        onClick: () async {
                          FocusScope.of(context).unfocus();
                          final date = await Utills.getDate(context);
                          controller.date.value =
                              DateFormat('dd MMMM, yyyy').format(date!);
                        },
                        icon: Icons.date_range_sharp),
                    10.width,
                    DateTimeTextFeild(dateTime: controller.date)
                  ],
                ),
              ),
              15.height,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
                child: Row(
                  children: [
                    DateTimeBox(
                        onClick: () async {
                          FocusScope.of(context).unfocus();
                          final time = await Utills.getTime(context);
                          controller.time.value =
                              controller.formatTimeOfDay(time!);
                        },
                        icon: Icons.access_time_rounded),
                    10.width,
                    DateTimeTextFeild(dateTime: controller.time)
                  ],
                ),
              ),
              15.height,
              AppDropdown(
                dropdownOptions: controller.expenseOptions,
                onChange: (selectedItems) {},
                label: '',
                selectedItem: controller.currentExpense,
                hint: '',
              ),
              15.height,
              AppTextFeild(
                textEditingController: controller.expenseAmountController,
                textInputType: TextInputType.none,
                errorMsg: controller.expenseAmountErrorMsg,
                mask: '',
                regExPattren: RegExp(''),
                label: 'Amount',
                hint: 'Amount',
                onTap: () {
                  controller.setCursorPosition(
                      controller.expenseAmountController.selection.baseOffset);
                },
              ),
              SizedBox(
                width: AppConstants.widht / 2.5,
                child: Wrap(
                  children: List.generate(
                    controller.buttonValues.length,
                    (index) => CustomKeyBoard(
                      value: controller.buttonValues[index],
                      onclick: () {
                        final value = controller.buttonValues[index];
                        if (value == 'Delete') {
                          controller.deleteTextAtCursor(value, true);
                        } else {
                          controller.insertTextAtCursor(value);
                          controller.setCursorPosition(
                            controller.expenseAmountController.text.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addExpense(),
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }
}
