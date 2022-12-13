import 'package:fandaniana/dao/expense_dao.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList(this.idDailyExpense, this.idTypeExpense);

  final int idDailyExpense;
  final int idTypeExpense;

  List<TableRow> _buildRowList() {
    List<Expense> expenses =
        ExpenseDao.getListDailyExpenseByType(idDailyExpense, idTypeExpense);
    //List<Expense> expenses = ExpenseDao.expenses;

    List<TableRow> result = [];

    result.add(TableRow(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Designation'),
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Price'),
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 15.0),
          child: Text('Amount'),
          height: 30.0,
        ),
      ],
    ));

    expenses.forEach((element) {
      result.add(TableRow(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(element.designation),
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('${element.unitPrice}'),
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('${element.amount}'),
            height: 30.0,
          ),
        ],
      ));
    });
    return result;
  }

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
}
