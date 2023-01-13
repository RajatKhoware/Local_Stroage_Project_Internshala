import 'package:flutter/material.dart';
import 'package:local_stroage/Presentation/screens/user_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersDataScreen(),
    );
  }
}
