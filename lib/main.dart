import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/screens/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox("expense");
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
