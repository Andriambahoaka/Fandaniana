import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.idDailyExpense, this.idTypeExpense, {super.key});

  final int idDailyExpense;
  final int idTypeExpense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Food"),
        const SizedBox(
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
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }

  List<TableRow> _buildRowList() {
    List<Expense> expenses =
        ExpenseDao.getListDailyExpenseByType(idDailyExpense, idTypeExpense);
    //List<Expense> expenses = ExpenseDao.expenses;

    List<TableRow> result = [];

    result.add(const TableRow(
      children: <Widget>[
        TableColumnExpense('Designation'),
        TableColumnExpense('price'),
        TableColumnExpense('Amount'),
      ],
    ));

    for (var element in expenses) {
      result.add(TableRow(
        children: <Widget>[
          TableColumnExpense(element.designation),
          TableColumnExpense('${element.unitPrice}'),
          TableColumnExpense('${element.amount}'),
        ],
      ));
    }
    return result;
  }
}

class TableColumnExpense extends StatelessWidget {
  const TableColumnExpense(this.columnText, {super.key});
  final String columnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      height: 30.0,
      child: Text(
        columnText,
        style: kTableTextStyle,
      ),
    );
  }
}
