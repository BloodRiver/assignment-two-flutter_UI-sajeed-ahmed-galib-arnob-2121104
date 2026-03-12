import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme.dart';
import '../models/transaction.dart';

class HomeWithTabs extends StatefulWidget {
  const HomeWithTabs({super.key});

  @override
  State<HomeWithTabs> createState() => _HomeWithTabsState();
}

class _HomeWithTabsState extends State<HomeWithTabs> {
  static String formatWithCommas(num number) {
    NumberFormat formatter = NumberFormat.decimalPattern("en_US");

    return formatter.format(number);
  }

  static List<int> splitMoneyAmount(num number) {
    double value = number.toDouble();
    int intPart = value.toInt();
    double doublePart = value - intPart;
    int doublePartToInt = (doublePart * 100).roundToDouble().toInt();

    return [intPart, doublePartToInt];
  }

  @override
  Widget build(BuildContext context) {
    // get these from context
    const double moneyAmount = 8945.32;
    const double savingsAmount = 5500;
    const double last30Days = 300;

    List<Container> transactionCards = [
      _transactionCard(
        transactionData: Transaction(
          name: "Netflix Subscription",
          category: "Entertainment",
          when: "Today",
          amount: 19.99,
          transactionType: Transaction.TYPE_EXPENSE,
        ),
      ),
      _transactionCard(
        transactionData: Transaction(
          name: "Coffee Shop",
          category: "Food & Drink",
          when: "Today",
          amount: 4.50,
          transactionType: Transaction.TYPE_EXPENSE,
        ),
      ),
      _transactionCard(
        transactionData: Transaction(
          name: "Salary Deposit",
          category: "Income",
          when: "Yesterday",
          amount: 3500,
          transactionType: Transaction.TYPE_INCOME,
        ),
      ),
      _transactionCard(
        transactionData: Transaction(
          name: "Grocery Store",
          category: "Shopping",
          when: "Today",
          amount: 55.80,
          transactionType: Transaction.TYPE_EXPENSE,
        ),
      ),
      _transactionCard(
        transactionData: Transaction(
          name: "Amazon Purchase",
          category: "Shopping",
          when: "Today",
          amount: 120.45,
          transactionType: Transaction.TYPE_EXPENSE,
        ),
      ),
    ];

    List<int> moneyAmountSplit = splitMoneyAmount(moneyAmount);

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 30,

            children: [
              _balanceStats(
                moneyAmountSplit: moneyAmountSplit,
                savingsAmount: savingsAmount,
                last30Days: last30Days,
              ),
              _navigationCards(),
              _transactionCardList(transactionCards: transactionCards),
            ],
          ),
        ],
      ),
    );
  }

  Padding _transactionCardList({required List<Container> transactionCards}) {
    List<Widget> transactionCardWidgets = [];

    transactionCardWidgets.addAll(transactionCards);
    return Padding(
      padding: EdgeInsets.only(bottom: 50, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              Text(
                "View All",
                style: TextStyle(
                  color: ThemeColor.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(spacing: 8, children: transactionCards),
        ],
      ),
    );
  }

  Container _transactionCard({required Transaction transactionData}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(10, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(Icons.ac_unit),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionData.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text("${transactionData.category} - ${transactionData.when}"),
                ],
              ),
            ],
          ),
          Text(
            "${((transactionData.transactionType == Transaction.TYPE_INCOME) ? '+' : '')}\$${transactionData.amount}",
            style: TextStyle(
              color:
                  ((transactionData.transactionType == Transaction.TYPE_EXPENSE)
                  ? ThemeColor.dangerColor
                  : ThemeColor.successColor),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Container _customCard({required Icon icon, required Text text}) {
    return Container(
      width: 180,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            offset: Offset(0, 3),
            // spreadRadius: 0.1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ThemeColor.primaryColor.withAlpha(50),
            ),
            child: icon,
          ),
          text,
        ],
      ),
    );
  }

  SizedBox _navigationCards() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              _customCard(
                icon: Icon(Icons.cable_sharp, color: ThemeColor.primaryColor),
                text: Text("Transfer"),
              ),
              _customCard(
                icon: Icon(Icons.attach_money, color: ThemeColor.primaryColor),
                text: Text("Pay Bills"),
              ),
              _customCard(
                icon: Icon(
                  Icons.payments_outlined,
                  color: ThemeColor.primaryColor,
                ),
                text: Text("Invest"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _balanceStats({
    required List<int> moneyAmountSplit,
    required double savingsAmount,
    required double last30Days,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColor.primaryColor,
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Balance", style: TextStyle(color: Colors.white)),
              Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$${formatWithCommas(moneyAmountSplit[0])}',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '.${moneyAmountSplit[1]}',
                style: TextStyle(
                  color: const Color.fromARGB(255, 190, 190, 190),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Divider(
            color: Color.fromARGB(255 ~/ 2, 255, 255, 255),
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Savings: \$${formatWithCommas(savingsAmount)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Last 30 days: +\$$last30Days',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Icon(Icons.arrow_forward_outlined, color: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
