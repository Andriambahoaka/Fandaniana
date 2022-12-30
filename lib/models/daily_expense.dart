import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/models/type_expense.dart';
import 'package:fandaniana/utilities/utility.dart';

import 'expense.dart';
import 'total_by_typeexpense.dart';
import 'package:intl/intl.dart';

class DailyExpense {
  DailyExpense(this.idDailyExpense, this.date);

  final int idDailyExpense;
  //final String date;
  final DateTime date;

  String getDateString() {
    return Utility.getStringDate(date);
  }

  List<TotalByTypeExpense> getListTotalByTypeExpense() {
    List<TotalByTypeExpense> result = [];
    List<TypeExpense> listTypeExpense = getListTypeExpense();

    for (var typeExpense in listTypeExpense) {
      List<Expense> listExpensesByType = getListExpensesByType(typeExpense);
      double totalPrice = getTotalExpenses(listExpensesByType);
      TotalByTypeExpense totalByTYpe =
          TotalByTypeExpense(this, typeExpense, totalPrice);
      result.add(totalByTYpe);
    }

    return result;
  }

  double getTotalExpenses(List<Expense> listExpense) {
    double total = 0.0;
    for (var element in listExpense) {
      total += element.getSubTotal();
    }
    return total;
  }

  double getDailyTotal() {
    List<Expense> listDailyExpense = getListDailyExpense();
    return getTotalExpenses(listDailyExpense);
  }

  List<Expense> getListDailyExpense() {
    return ExpenseDao.expenses
        .where((element) => element.idDailyExpense == idDailyExpense)
        .toList();
  }

  List<Expense> getListExpensesByType(TypeExpense typeExpense) {
    List<Expense> listDailyExpense = getListDailyExpense();
    return listDailyExpense
        .where((element) =>
            element.typeExpense.idTypeExpense == typeExpense.idTypeExpense)
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

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
