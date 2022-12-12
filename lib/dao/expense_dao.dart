import 'package:fandaniana/models/expense_summary.dart';
import 'package:fandaniana/models/overall.dart';
import 'package:fandaniana/models/type_expense.dart';

import '../models/expense.dart';
import '../widgets/type_expense_card.dart';

class ExpenseDao {
  static List<Expense> expenses = [
    Expense('Food', 'food', 500.0),
    Expense('Drinks', 'drinks', 600.0),
    Expense('Clothing', 'clothing', 600.0),
  ];

  static List<Overall> overalls = [
    Overall(ExpenseSummary('Today', 1400.0), expenses),
    Overall(ExpenseSummary('12/02/2013', 1400.0), expenses),
    Overall(ExpenseSummary('12/02/2013', 1400.0), expenses),
  ];

  static List<TypeExpenseCard> typeExpenses = [
    TypeExpenseCard(TypeExpense('Food', 'food')),
    TypeExpenseCard(TypeExpense('Car', 'car')),
    TypeExpenseCard(TypeExpense('Drinks', 'drinks')),
    TypeExpenseCard(TypeExpense('Gift', 'gift')),
    TypeExpenseCard(TypeExpense('Phone', 'phone')),
    TypeExpenseCard(TypeExpense('House', 'house')),
  ];

  static int get expenseCount {
    return expenses.length;
  }

  static int get typeExpenseCount {
    return typeExpenses.length;
  }
}
