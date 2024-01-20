import 'package:expense_traker/core/routes/routes.dart';
import 'package:expense_traker/src/ui/add_expense/presenation/screen/add_expense_screen.dart';
import 'package:expense_traker/src/ui/home/presenation/screen/home.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../src/ui/add_expense/binding/add_expense_screen_binding.dart';
import '../../src/ui/home/binding/home_binding.dart';

class AppPages {
  static var getpages = [
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.addExpenseScreen,
      page: () => AddExpenseScreen(),
      binding: AddExpenseScreenBinding(),
    ),
  ];
}
