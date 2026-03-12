import 'package:flutter/material.dart';
import 'homepage.dart';
import '../theme.dart';
import 'reportspage.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  static const String _studentName = "Sajeed Ahmed Galib Arnob";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: _welcomeTitle(),
        leading: _leadingIconWithInitial(),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 218, 214, 214),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [HomeWithTabs(), ReportsWithTabs()],
      ),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }

  Column _welcomeTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back,",
          style: TextStyle(
            fontSize: 12,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          _studentName.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Container _leadingIconWithInitial() {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: ThemeColor.primaryColor,
        borderRadius: BorderRadius.circular(9999),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.shadowColor,
            spreadRadius: 3,
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Text(
        _studentName[0].toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  BottomNavigationBar _BottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (i) {
        setState(() => _currentIndex = i);
        _pageController.jumpToPage(i);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_graph_outlined),
          label: "Reports",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Cards",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_outlined),
          label: "Profile",
        ),
      ],
    );
  }
}
