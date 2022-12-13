import 'package:fandaniana/widgets/total_bytype_tile.dart';
import 'package:flutter/cupertino.dart';

import '../dao/expense_dao.dart';
import '../models/total_by_typeexpense.dart';

class TotalByTypeExpenseList extends StatelessWidget {
  TotalByTypeExpenseList(this.totalByTypeList);

  List<TotalByTypeExpense> totalByTypeList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final expense = totalByTypeList[index];
        return TotalByTypeExpenseTile(expense);
      },
      itemCount: ExpenseDao.expenseCount,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
