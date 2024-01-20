import 'package:expense_traker/core/local_storage/models/expense_model/expense_model.dart';
import 'package:expense_traker/core/local_storage/remote_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseScreenController extends GetxController {
  var expenseTitleController = TextEditingController();
  var expensetitleErrorMsg = ''.obs;
  var expenseDescriptionController = TextEditingController();
  var expenseDesErrorMsg = ''.obs;
  var expenseAmountController = TextEditingController();
  var expenseAmountErrorMsg = ''.obs;
  var date = 'Date'.obs;
  var time = 'Time'.obs;
  var expenseOptions = ['Expense', 'Income'];
  var currentExpense = 'Expense'.obs;
  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(dateTime);
  }

  final List<String> buttonValues = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    'Delete'
  ];
  var cursorPosition = 0.obs;
  setCursorPosition(int position) {
    if (position >= 0 && position <= expenseAmountController.text.length) {
      cursorPosition.value = position;
      expenseAmountController.selection =
          TextSelection.collapsed(offset: cursorPosition.value);
    }
  }

  insertTextAtCursor(String textToInsert) {
    if (cursorPosition.value >= 0) {
      String currentText = expenseAmountController.text;
      String newText = currentText.substring(0, cursorPosition.value) +
          textToInsert +
          currentText.substring(cursorPosition.value);
      expenseAmountController.value = expenseAmountController.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(
            offset: cursorPosition.value + textToInsert.length),
      );
    } else {
      cursorPosition.value = 0;
    }
  }

  deleteTextAtCursor(String value, bool isDeletion) {
    String currentText = expenseAmountController.text;
    int cursorPositionDel = expenseAmountController.selection.base.offset;

    if (isDeletion && cursorPositionDel > 0) {
      String newText = currentText.substring(0, cursorPositionDel - 1) +
          currentText.substring(cursorPositionDel);
      expenseAmountController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPositionDel - 1),
      );
    } else {
      cursorPosition.value = 0;
    }
  }

  addExpense() {
    if (expenseTitleController.text.isNotEmpty &&
        expensetitleErrorMsg.isEmpty &&
        expenseDescriptionController.text.isNotEmpty &&
        date.value != 'Date' &&
        time.value != 'Time' &&
        expenseAmountController.text.isNotEmpty) {
      AppRemoteBoxes.addExpense(
        ExpenseHiveBoxModel(
            expenseTitleController.text,
            expenseDescriptionController.text,
            date.value,
            time.value,
            int.parse(expenseAmountController.text),
            currentExpense.value),
      );
      Get.back();
    } else {
      Get.snackbar(
        'alert',
        'all feilds are requried',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
