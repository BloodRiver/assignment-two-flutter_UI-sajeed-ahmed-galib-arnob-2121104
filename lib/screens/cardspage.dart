import 'package:flutter/material.dart';
import '../models/user.dart';

class CardsWithTabs extends StatefulWidget {
  final Student loggedInStudent;
  const CardsWithTabs({super.key, required this.loggedInStudent});

  @override
  State<CardsWithTabs> createState() => _CardsWithTabsState();
}

class _CardsWithTabsState extends State<CardsWithTabs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
