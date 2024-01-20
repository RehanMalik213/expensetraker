import 'package:expense_traker/core/resouces/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpenseChart extends StatelessWidget {
  final List<Color> colorList;
  final Map<String, double> chartData;
  const ExpenseChart(
      {super.key, required this.colorList, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PieChart(
        emptyColor: AppColors.borderColor,
        ringStrokeWidth: 13,
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: false,
        ),
        initialAngleInDegree: 60,
        colorList: colorList,
        chartType: ChartType.ring,
        dataMap: chartData,
      ),
    );
  }
}
