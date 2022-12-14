import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/models/type_expense.dart';

import 'expense.dart';
import 'total_by_typeexpense.dart';

class DailyExpense {
  DailyExpense(this.idDailyExpense, this.date);

  final int idDailyExpense;
  final String date;
  //final DateTime date;

  List<TotalByTypeExpense> getListTotalByTypeExpense() {
    List<TotalByTypeExpense> result = [];
    List<Expense> listDailyExpense = getListDailyExpense();
    List<TypeExpense> listTypeDepense = getListTypeExpense();

    for (var typeExpense in listTypeDepense) {
      List<Expense> listExpensesByType = listDailyExpense
          .where((element) =>
              element.typeExpense.idTypeExpense == typeExpense.idTypeExpense)
          .toList();
      double totalPrice = getTotalExpenses(listExpensesByType);
      TotalByTypeExpense totalByTYpe =
          TotalByTypeExpense(idDailyExpense, typeExpense, totalPrice);
      result.add(totalByTYpe);
    }

    return result;
  }

  double getDailyTotal() {
    List<Expense> listDailyExpense = getListDailyExpense();
    return getTotalExpenses(listDailyExpense);
  }

  double getTotalExpenses(List<Expense> listExpense) {
    double total = 0.0;
    for (var element in listExpense) {
      total += element.getSubTotal();
    }
    return total;
  }

  List<Expense> getListDailyExpense() {
    return ExpenseDao.expenses
        .where((element) => element.idDailyExpense == idDailyExpense)
        .toList();
  }

  List<TypeExpense> getListTypeExpense() {
    List<Expense> listDailyExpense = getListDailyExpense();
    final added = <int>{};
    return listDailyExpense
        .map((e) => e.typeExpense)
        .where((element) => added.add(element.idTypeExpense))
        .toList();
  }
}
