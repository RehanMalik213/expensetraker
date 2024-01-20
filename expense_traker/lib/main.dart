import 'package:expense_traker/core/local_storage/models/boxes.dart';
import 'package:expense_traker/core/local_storage/models/expense_model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/routes/pages.dart';
import 'core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(ExpenseHiveBoxModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<ExpenseHiveBoxModel>(AppBoxes.expenseModel);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      getPages: AppPages.getpages,
    );
  }
}
