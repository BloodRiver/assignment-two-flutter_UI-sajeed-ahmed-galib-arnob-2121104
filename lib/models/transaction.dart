import 'package:flutter/material.dart';

class Transaction {
  String name;
  String category;
  String when;
  double amount;
  static const int TYPE_INCOME = 1;
  static const int TYPE_EXPENSE = 2;
  int transactionType;
  Icon icon;

  Transaction({
    required this.name,
    required this.category,
    required this.when,
    required this.amount,
    required this.transactionType,
    required this.icon,
  });
}
