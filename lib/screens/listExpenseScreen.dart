import 'package:fandaniana/dao/expense_dao.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';
import '../widgets/expense_tile.dart';
import '../widgets/total_bytype_tile.dart';

class ListExpenseScreen extends StatelessWidget {
  ListExpenseScreen(this.idTypeExpense, this.idDailyExpense);

  final int idTypeExpense;
  final int idDailyExpense;

  final List<Expense> list = ExpenseDao.expenses
      .where((element) => element.idTypeExpense == 1)
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final expense = list[index];
        return ExpenseTile();
      },
      itemCount: ExpenseDao.expenseCount,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
