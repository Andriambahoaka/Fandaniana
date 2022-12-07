import 'package:fandaniana/models/expense_summary.dart';
import 'package:fandaniana/models/overall.dart';

import '../models/depense.dart';

class ExpenseDao {
  static List<Depense> expenses = [
    Depense('Food', 'hamburger', 500.0),
    Depense('Drinks', 'drinks', 600.0),
    Depense('Clothing', 'shirt', 600.0),
  ];

  static List<Overall> overalls = [
    Overall(ExpenseSummary('Today', 1400.0), expenses),
    Overall(ExpenseSummary('12/02/2013', 1400.0), expenses),
    Overall(ExpenseSummary('12/02/2013', 1400.0), expenses),
  ];

  static int get expenseCount {
    return expenses.length;
  }
}
