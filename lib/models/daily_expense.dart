import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/models/type_expense.dart';

import 'expense.dart';
import 'total_by_typeexpense.dart';

class DailyExpense {
  DailyExpense(this.idDailyExpense, this.date, this.total);

  final int idDailyExpense;
  final String date;
  //final DateTime date;
  final double total;

  List<TotalByTypeExpense> getListTotalByTypeExpense() {
    List<TotalByTypeExpense> result = [];
    List<Expense> listDailyExpense = ExpenseDao.expenses
        .where((element) => element.idDailyExpense == idDailyExpense)
        .toList();
    List<TypeExpense> listTypeDepense =
        listDailyExpense.map((e) => e.typeExpense).toSet().toList();

    listTypeDepense.forEach((typeExpense) {
      List<Expense> listExpensesByType = listDailyExpense
          .where((element) =>
              element.typeExpense.idTypeExpense == typeExpense.idTypeExpense)
          .toList();
    });

    return result;
  }
}
