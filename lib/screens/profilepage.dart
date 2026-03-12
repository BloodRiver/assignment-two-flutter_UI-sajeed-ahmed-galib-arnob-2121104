import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileWithTabs extends StatefulWidget {
  final Student loggedInStudent;
  const ProfileWithTabs({super.key, required this.loggedInStudent});

  @override
  State<ProfileWithTabs> createState() => _ProfileWithTabsState();
}

class _ProfileWithTabsState extends State<ProfileWithTabs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
