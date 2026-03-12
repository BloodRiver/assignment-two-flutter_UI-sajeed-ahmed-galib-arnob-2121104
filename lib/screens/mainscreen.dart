import 'package:flutter/material.dart';
import 'homepage.dart';
import '../theme.dart';
import 'reportspage.dart';
import 'cardspage.dart';
import 'profilepage.dart';
import '../models/user.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Student loggedInStudent = Student(
      name: "Sajeed Ahmed Galib Arnob",
      id: "2121104",
      email: "2121104@iub.edu.bd",
      bio: "Just A Rather Very Enthusiastic Programmer",
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: _welcomeTitle(loggedInStudent),
        leading: _leadingIconWithInitial(loggedInStudent),
        actions: [_notificationsButton()],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeWithTabs(),
          ReportsWithTabs(),
          CardsWithTabs(loggedInStudent: loggedInStudent),
          ProfileWithTabs(loggedInStudent: loggedInStudent),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Container _notificationsButton() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 218, 214, 214),
      ),
      alignment: Alignment.center,
      child: Icon(Icons.notifications_outlined),
    );
  }

  Column _welcomeTitle(Student loggedInStudent) {
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
          loggedInStudent.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Container _leadingIconWithInitial(Student loggedInStudent) {
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
        loggedInStudent.name[0].toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
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
