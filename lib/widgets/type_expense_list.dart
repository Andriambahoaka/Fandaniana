import 'package:fandaniana/dao/expense_dao.dart';
import 'package:flutter/cupertino.dart';

class TypeExpenseList extends StatelessWidget {
  const TypeExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExpenseDao expenseDao = ExpenseDao();
    return ListView.builder(
      itemBuilder: (context, index) {
        final type = expenseDao.getListExpenseCard()[index];
        return type;
      },
      itemCount: expenseDao.typeExpenseCount,
    );
  }
}
