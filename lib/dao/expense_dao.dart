import 'dart:collection';
import 'dart:math';

import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/models/type_expense.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';
import '../widgets/type_expense_card.dart';

class ExpenseDao extends ChangeNotifier {
  static DateTime moonParting = DateTime.parse('2022-12-27 20:18:04Z');
  static DateTime moonLanding = DateTime.parse('2022-12-28 20:18:04Z');
  static DateTime moonActual = DateTime.parse('2022-12-29 20:18:04Z');

  static DailyExpense daily1 = DailyExpense(1, moonParting);
  static DailyExpense daily2 = DailyExpense(2, moonLanding);
  static DailyExpense daily3 = DailyExpense(3, moonActual);

  late List<TypeExpense> typeExpenseList;

  ExpenseDao() {
    checkTodayDate();
  }

  static List<TypeExpense> typeExpenses = [
    TypeExpense(1, 'Food', 'food'),
    TypeExpense(2, 'Car', 'car'),
    TypeExpense(3, 'Drinks', 'drinks'),
    TypeExpense(4, 'Gift', 'gift'),
    TypeExpense(5, 'Phone', 'phone'),
    TypeExpense(6, 'House', 'house'),
  ];

  // static List<TotalByTypeExpense> totalByType = [
  //   TotalByTypeExpense(daily1, TypeExpense(1, 'Food', 'food'), 500.0),
  //   TotalByTypeExpense(daily2, TypeExpense(2, 'Car', 'car'), 600.0),
  //   TotalByTypeExpense(daily3, TypeExpense(6, 'House', 'house'), 600.0),
  // ];

  //static List<DailyExpense> overalls = [daily1, daily2, daily3];
  final List<DailyExpense> _overalls = [];

  List<DailyExpense> get overalls {
    return _overalls;
  }

  // UnmodifiableListView<DailyExpense> get overalls {
  //   return UnmodifiableListView(_overalls);
  // }

  final List<Expense> _expenses = [];

  List<Expense> get expenses {
    return _expenses;
  }

  // static List<Expense> expenses = [
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 1,
  //       typeExpense: TypeExpense(1, 'Food', 'food'),
  //       designation: "Nem",
  //       unitPrice: 300.0,
  //       amount: 3),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 1,
  //       typeExpense: TypeExpense(1, 'Food', 'food'),
  //       designation: "Sandwich",
  //       unitPrice: 1000.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 2,
  //       typeExpense: TypeExpense(2, 'Car', 'car'),
  //       designation: "Gasoil",
  //       unitPrice: 15000.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 2,
  //       typeExpense: TypeExpense(2, 'Car', 'car'),
  //       designation: "Gasoil",
  //       unitPrice: 100.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 2,
  //       typeExpense: TypeExpense(6, 'House', 'house'),
  //       designation: "Jirama",
  //       unitPrice: 20000.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 2,
  //       typeExpense: TypeExpense(6, 'House', 'house'),
  //       designation: "Jirama",
  //       unitPrice: 20000.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 2,
  //       typeExpense: TypeExpense(6, 'House', 'house'),
  //       designation: "Jirama",
  //       unitPrice: 20000.0,
  //       amount: 1),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 3,
  //       typeExpense: TypeExpense(1, 'Food', 'food'),
  //       designation: "Karoty",
  //       unitPrice: 300.0,
  //       amount: 3),
  //   Expense(
  //       idExpense: 1,
  //       idDailyExpense: 3,
  //       typeExpense: TypeExpense(1, 'House', 'house'),
  //       designation: "Mixeur",
  //       unitPrice: 10000.0,
  //       amount: 1),
  // ];

  void addNewDailyExpense(DailyExpense dailyExpense) {
    _overalls.add(dailyExpense);
  }

  void addNewExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  List<TypeExpenseCard> getListExpenseCard() {
    List<TypeExpenseCard> result = [];
    for (var element in typeExpenses) {
      result.add(TypeExpenseCard(element));
    }
    return result;
  }

  List<Expense> getListDailyExpenseByType(
      int idDaily, TypeExpense typeExpense) {
    return _expenses
        .where((element) =>
            element.idDailyExpense == idDaily &&
            element.typeExpense.idTypeExpense == typeExpense.idTypeExpense)
        .toList();
  }

  int get typeExpenseCount {
    return typeExpenses.length;
  }

  void selectType(TypeExpense type) {
    for (var item in typeExpenses) {
      item.isSelected = false;
    }
    type.isSelected = true;
    notifyListeners();
  }

  void unSelectTypeExpense(TypeExpense type) {
    type.isSelected = false;
  }

  int getLastIdOveralls() {
    return _overalls[overalls.length - 1].idDailyExpense;
  }

  int getLastIdExpenses() {
    if (_expenses.isEmpty) {
      return 0;
    } else {
      return _expenses[_expenses.length - 1].idExpense;
    }
  }

  void checkTodayDate() {
    DateTime now = DateTime.now();

    if (_overalls.isNotEmpty) {
      DateTime lastDate = _overalls[overalls.length - 1].date;

      if (!lastDate.isSameDate(now)) {
        int id = getLastIdOveralls() + 1;
        DailyExpense newDaily = DailyExpense(id, now);
        _overalls.add(newDaily);
      }
    } else {
      DailyExpense newDaily = DailyExpense(1, now);
      _overalls.add(newDaily);
    }

    notifyListeners();
  }
}
