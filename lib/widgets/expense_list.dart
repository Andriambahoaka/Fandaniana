import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.idDailyExpense, this.idTypeExpense);

  final int idDailyExpense;
  final int idTypeExpense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Food"),
        SizedBox(
          height: 15.0,
        ),
        Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: _buildRowList(),
        ),
      ],
    );
  }

  List<TableRow> _buildRowList() {
    List<Expense> expenses =
        ExpenseDao.getListDailyExpenseByType(idDailyExpense, idTypeExpense);
    //List<Expense> expenses = ExpenseDao.expenses;

    List<TableRow> result = [];

    result.add(TableRow(
      children: <Widget>[
        TableColumnExpense('Designation'),
        TableColumnExpense('price'),
        TableColumnExpense('Amount'),
      ],
    ));

    expenses.forEach((element) {
      result.add(TableRow(
        children: <Widget>[
          TableColumnExpense('${element.designation}'),
          TableColumnExpense('${element.unitPrice}'),
          TableColumnExpense('${element.amount}'),
        ],
      ));
    });
    return result;
  }
}

class TableColumnExpense extends StatelessWidget {
  TableColumnExpense(this.columnText);

  final String columnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        columnText,
        style: kLabelTextStyle,
      ),
      height: 30.0,
    );
  }
}
