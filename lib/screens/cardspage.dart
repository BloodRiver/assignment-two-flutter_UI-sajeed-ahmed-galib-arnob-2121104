import 'package:flutter/material.dart';
import '../models/user.dart';
import '../components/components.dart';
import '../theme.dart';

class CardsWithTabs extends StatefulWidget {
  final Student loggedInStudent;
  const CardsWithTabs({super.key, required this.loggedInStudent});

  @override
  State<CardsWithTabs> createState() => _CardsWithTabsState();
}

class _CardsWithTabsState extends State<CardsWithTabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Cards",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  _bankCardWithDetails(context),
                  navigationCards(
                    context: context,
                    iconsAndText: {
                      Icon(Icons.cancel, color: ThemeColor.primaryColor):
                          'Block',
                      Icon(
                        Icons.payment_outlined,
                        color: ThemeColor.primaryColor,
                      ): 'Details',
                      Icon(Icons.info_outline, color: ThemeColor.primaryColor):
                          'Limit',
                    },
                  ),
                  Text(
                    "Linked Accounts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(20, 0, 0, 0),
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ThemeColor.primaryColor.withAlpha(
                                      50,
                                    ),
                                  ),
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.primaryColor,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 2,
                                  children: [
                                    Text(
                                      "Shared Savings",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\$5,500.00",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward, color: Colors.grey),
                          ],
                        ),
                      ),
                      SizedBox(height: 300),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _bankCardWithDetails(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [Color(0xff1B333D), Color(0xff17202F), Color(0xff1E2843)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 35,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow.shade700,
                  ),
                ),
                Text(
                  "BANK",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              "4 5 6 7  ****  ****  1 2 3 4",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CARD HOLDER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      "EXPIRES",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.loggedInStudent.name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "12/28",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
