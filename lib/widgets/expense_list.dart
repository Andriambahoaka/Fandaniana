import 'package:fandaniana/widgets/total_bytype_tile.dart';
import 'package:flutter/cupertino.dart';

import '../dao/expense_dao.dart';
import '../models/total_by_typeexpense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.expenses);

  List<TotalByTypeExpense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return TotalByTypeExpenseTile(expense);
      },
      itemCount: ExpenseDao.expenseCount,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
