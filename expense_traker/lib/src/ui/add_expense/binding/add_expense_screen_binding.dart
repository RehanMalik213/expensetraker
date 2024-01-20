import 'package:expense_traker/src/ui/add_expense/controller/add_expense_screen_controller.dart';
import 'package:get/get.dart';

class AddExpenseScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddExpenseScreenController(), fenix: true);
  }
}
