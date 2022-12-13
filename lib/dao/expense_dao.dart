import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/models/type_expense.dart';

import '../models/expense.dart';
import '../models/total_by_typeexpense.dart';
import '../widgets/type_expense_card.dart';

class ExpenseDao {
  static List<TypeExpense> typeExpenses = [
    TypeExpense(1, 'Food', 'food'),
    TypeExpense(2, 'Car', 'car'),
    TypeExpense(3, 'Drinks', 'drinks'),
    TypeExpense(4, 'Gift', 'gift'),
    TypeExpense(5, 'Phone', 'phone'),
    TypeExpense(6, 'House', 'house'),
  ];

  static List<TotalByTypeExpense> totalByType = [
    TotalByTypeExpense(TypeExpense(1, 'Food', 'food'), 500.0),
    TotalByTypeExpense(TypeExpense(2, 'Car', 'car'), 600.0),
    TotalByTypeExpense(TypeExpense(3, 'House', 'house'), 600.0),
  ];

  static List<DailyExpense> overalls = [
    DailyExpense(1, 'Today', 1400.0, totalByType),
    DailyExpense(2, '12/02/2013', 1400.0, totalByType),
    DailyExpense(3, '12/02/2013', 1400.0, totalByType),
  ];

  static List<Expense> expenses = [
    Expense(
        idExpense: 1,
        idDailyExpense: 1,
        idTypeExpense: 1,
        designation: "Nem",
        unitPrice: 300.0,
        amount: 3),
    Expense(
        idExpense: 1,
        idDailyExpense: 1,
        idTypeExpense: 1,
        designation: "Sandwich",
        unitPrice: 1000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        idTypeExpense: 2,
        designation: "Gasoil",
        unitPrice: 15000.0,
        amount: 1),
    Expense(
        idExpense: 1,
        idDailyExpense: 2,
        idTypeExpense: 6,
        designation: "Jirama",
        unitPrice: 20000.0,
        amount: 1),
  ];

  static List<TypeExpenseCard> getListExpenseCard() {
    List<TypeExpenseCard> result = [];
    typeExpenses.forEach((element) {
      result.add(TypeExpenseCard(element));
    });
    return result;
  }

  static int get expenseCount {
    return totalByType.length;
  }

  static int get typeExpenseCount {
    return typeExpenses.length;
  }
}
