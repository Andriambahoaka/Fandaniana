import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseDao(),
      child: const MaterialApp(
        home: SafeArea(child: ExpenseScreen()),
      ),
    );
  }
}
