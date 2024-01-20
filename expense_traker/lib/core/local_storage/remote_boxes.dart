import 'package:expense_traker/core/local_storage/models/expense_model/expense_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/boxes.dart';

class AppRemoteBoxes {
  AppRemoteBoxes._();
  static Box<ExpenseHiveBoxModel> getAllExpense() =>
      Hive.box(AppBoxes.expenseModel);

  static addExpense(ExpenseHiveBoxModel data) {
    final box = getAllExpense();
    box.add(
      ExpenseHiveBoxModel(
        data.expenseTitle,
        data.expenseDescription,
        data.expenseDate,
        data.expenseTime,
        data.expenseAmount,
        data.expense,
      ),
    );
  }
}
