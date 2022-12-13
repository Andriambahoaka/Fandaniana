import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/models/type_expense.dart';

import '../models/total_by_typeexpense.dart';
import '../widgets/type_expense_card.dart';

class ExpenseDao {
  static List<TotalByTypeExpense> totalByType = [
    TotalByTypeExpense(TypeExpense('Food', 'food'), 500.0),
    TotalByTypeExpense(TypeExpense('Car', 'car'), 600.0),
    TotalByTypeExpense(TypeExpense('House', 'house'), 600.0),
  ];

  static List<DailyExpense> overalls = [
    DailyExpense(1, 'Today', 1400.0, totalByType),
    DailyExpense(2, '12/02/2013', 1400.0, totalByType),
    DailyExpense(3, '12/02/2013', 1400.0, totalByType),
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
    return totalByType.length;
  }

  static int get typeExpenseCount {
    return typeExpenses.length;
  }
}
