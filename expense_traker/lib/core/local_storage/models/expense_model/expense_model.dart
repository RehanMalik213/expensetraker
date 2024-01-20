import 'package:hive_flutter/hive_flutter.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseHiveBoxModel extends HiveObject {
  @HiveField(0)
  final String expenseTitle;
  @HiveField(1)
  final String expenseDescription;
  @HiveField(2)
  final String expenseDate;
  @HiveField(3)
  final String expenseTime;
  @HiveField(4)
  final int expenseAmount;
  @HiveField(5)
  final String expense;

  ExpenseHiveBoxModel(this.expenseTitle, this.expenseDescription,
      this.expenseDate, this.expenseTime, this.expenseAmount, this.expense);
}
