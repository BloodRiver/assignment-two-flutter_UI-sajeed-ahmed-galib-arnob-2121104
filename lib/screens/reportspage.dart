import 'package:assignment_two_flutter_ui/theme.dart';
import 'package:flutter/material.dart';

class ReportsWithTabs extends StatefulWidget {
  const ReportsWithTabs({super.key});

  @override
  State<ReportsWithTabs> createState() => _ReportsWithTabsState();
}

class _ReportsWithTabsState extends State<ReportsWithTabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Text(
                "Monthly Spending Report",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              _totalExpensesDisplay(),
              _spendingBreakdown(),
            ],
          ),
        ],
      ),
    );
  }

  Container _spendingBreakdown() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            offset: Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Spending Breakdown",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _progressBar(
            title: "Food & Drink",
            amount: 450.00,
            percentage: 35,
            color: Colors.red,
          ),
          _progressBar(
            title: "Shopping",
            amount: 320.00,
            percentage: 25,
            color: ThemeColor.primaryColor,
          ),
          _progressBar(
            title: "Housing",
            amount: 280.00,
            percentage: 22,
            color: Colors.yellow.shade700,
          ),
          _progressBar(
            title: "Transport",
            amount: 150.00,
            percentage: 12,
            color: Colors.green,
          ),
          _progressBar(
            title: "Other",
            amount: 70.00,
            percentage: 6,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Column _progressBar({
    required String title,
    required double amount,
    required int percentage,
    required Color color,
  }) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 10)),
            Text(
              "\$${((amount * 100).roundToDouble() / 100).toStringAsFixed(2)} ($percentage%)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: percentage / 100,
          minHeight: 12,
          borderRadius: BorderRadius.circular(12),
          color: color,
          backgroundColor: Colors.grey.shade300,
        ),
      ],
    );
  }

  Container _totalExpensesDisplay() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            offset: Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Expenses (Last 30 Days)",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "-\$1270.00",
            style: TextStyle(
              color: ThemeColor.dangerColor,
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          ),
          Row(
            children: [
              Icon(Icons.arrow_upward, color: ThemeColor.dangerColor),
              Text(
                "Up 12% from last month",
                style: TextStyle(color: ThemeColor.dangerColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
