import 'package:fandaniana/models/daily_expense.dart';
import 'package:fandaniana/utilities/constants.dart';
import 'package:fandaniana/utilities/utility.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../models/type_expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.dailyExpense, this.typeExpense, this.totalPrice);

  final DailyExpense dailyExpense;
  final TypeExpense typeExpense;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text('Date: ${dailyExpense.date}', style: kTableTextStyle),
          title: Card(
            color: Colors.blueGrey,
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10.0),
                  Text(typeExpense.type, style: kTableTextStyle),
                  const SizedBox(width: 10.0),
                  LoadImage(typeExpense.image),
                ]),
          ),
          trailing: Text('- Ar $totalPrice', style: kTableTextStyle),
        ),
        Table(
          border: const TableBorder(
              horizontalInside: BorderSide(
                  width: 1, color: Colors.blue, style: BorderStyle.solid)),
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
    List<Expense> expenses = dailyExpense.getListExpensesByType(typeExpense);
    //List<Expense> expenses = ExpenseDao.expenses;

    List<TableRow> result = [];

    result.add(const TableRow(
      children: <Widget>[
        TableColumnExpense('Designation'),
        TableColumnExpense('Price'),
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
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 15.0,
      ),
      height: 50.0,
      child: Text(
        columnText,
        style: kTableTextStyle,
      ),
    );
  }
}
