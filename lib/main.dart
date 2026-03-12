import 'package:flutter/material.dart';
import 'screens/mainscreen.dart';
import 'theme.dart';

final Color myPrimaryColor = ThemeColor.primaryColor;

final lightScheme = ColorScheme.fromSeed(
  seedColor: myPrimaryColor,
  brightness: Brightness.light,
);

final darkScheme = ColorScheme.fromSeed(
  seedColor: myPrimaryColor,
  brightness: Brightness.dark,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkScheme),
      themeMode: ThemeMode.light,
      home: MyScreen(),
      title: "Assignment Two - Flutter UI",
    );
  }
}
