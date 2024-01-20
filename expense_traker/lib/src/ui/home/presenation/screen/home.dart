import 'package:expense_traker/core/extenssions/app_extenssions.dart';
import 'package:expense_traker/core/local_storage/models/expense_model/expense_model.dart';
import 'package:expense_traker/core/local_storage/remote_boxes.dart';
import 'package:expense_traker/src/ui/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/app_constants/app_constants.dart';
import '../../../../../core/routes/routes.dart';
import '../widgets/add_button.dart';
import '../widgets/card_row.dart';
import '../widgets/expense_chart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: AppRemoteBoxes.getAllExpense().listenable(),
        builder: (context, value, child) {
          var data = value.values.cast<ExpenseHiveBoxModel>().toList();
          if (data.isNotEmpty) {
            controller.calclutionExpenseChart(data);
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.bodyPadding),
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.height * 0.30,
                  width: AppConstants.widht,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      40.height,
                      AddButton(
                        onClick: () {
                          Get.toNamed(AppRoutes.addExpenseScreen);
                        },
                      ),
                      ExpenseChart(
                        colorList: controller.colorList,
                        chartData: controller.chartData,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        elevation: 5,
                        child: CardRow(
                          index: index,
                          title: data[index].expenseTitle,
                          description: data[index].expenseDescription,
                          dateTime:
                              '${data[index].expenseDate} at ${data[index].expenseTime}',
                          expenseAmount: data[index].expenseAmount.toString(),
                          expense: data[index].expense,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
