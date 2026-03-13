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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff1B333D), Color(0xff17202F), Color(0xff1E2843)],
            ),
          ),
          child: Column(),
        ),
      ],
    );
  }
}
