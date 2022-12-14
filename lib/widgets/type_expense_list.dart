import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/widgets/type_expense_card.dart';
import 'package:flutter/cupertino.dart';

class TypeExpenseList extends StatelessWidget {
  const TypeExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final type = ExpenseDao.getListExpenseCard()[index];
        return type;
      },
      itemCount: ExpenseDao.typeExpenseCount,
    );
  }
}