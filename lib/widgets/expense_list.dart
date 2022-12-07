import 'package:fandaniana/widgets/expense_tile.dart';
import 'package:flutter/cupertino.dart';

import '../dao/expense_dao.dart';
import '../models/depense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.expenses);

  List<Depense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return ExpenseTile(expense);
      },
      itemCount: ExpenseDao.expenseCount,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
