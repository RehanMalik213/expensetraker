import 'package:expense_traker/core/local_storage/models/expense_model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resouces/app_colors.dart';

class HomeScreenController extends GetxController {
  var chartData = {
    "Expense": 0.0,
    "Income": 0.0,
    "Saving": 0.0,
  }.obs;
  var colorList = [
    Colors.red,
    Colors.green,
    AppColors.hintTextColor,
  ];
  var income = 0;
  var expense = 0;
  var saving = 0;
  var expenseOption = [
    'Expense',
    'Icome',
  ];
  var currentExpenseValue = 'Expense';
  calclutionExpenseChart(List<ExpenseHiveBoxModel> data) {
    income = 0;
    expense = 0;
    saving = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i].expense == 'Income') {
        income += data[i].expenseAmount;
      } else {
        expense += data[i].expenseAmount;
      }
    }
    chartData['Income'] = income.toDouble();
    chartData['Expense'] = expense.toDouble();
    saving = income - expense;
    chartData['Saving'] = saving.toDouble();
  }
}
