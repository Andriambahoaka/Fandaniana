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
        Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RichText(
              text: TextSpan(style: kTableTextStyle, children: [
                const TextSpan(
                    text: 'Date : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '${dailyExpense.date}'),
              ]),
            ),
            Card(
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(typeExpense.type,
                          style: kTableTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(
                        width: 8.0,
                      ),
                      LoadImage(typeExpense.image),
                    ]),
              ),
            ),
          ]
                  //trailing: Text('- Ar $totalPrice', style: kTableTextStyle),
                  ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Table(
          border: const TableBorder(
              horizontalInside: BorderSide(
                  width: 1, color: Colors.blueGrey, style: BorderStyle.solid)),
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(120.0),
            1: FlexColumnWidth(),
            2: FixedColumnWidth(60.0),
            3: FlexColumnWidth()
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

    result.add(TableRow(
      children: <Widget>[
        TableColumnExpense('Designation',
            color: kTableHeadColor, style: kTableTextStyleWeight),
        TableColumnExpense('Price',
            color: kTableHeadColor, style: kTableTextStyleWeight),
        TableColumnExpense('Qty',
            color: kTableHeadColor, style: kTableTextStyleWeight),
        TableColumnExpense('Subtotal',
            color: kTableHeadColor, style: kTableTextStyleWeight),
      ],
    ));

    for (var element in expenses) {
      result.add(TableRow(
        children: <Widget>[
          TableColumnExpense(element.designation),
          TableColumnExpense('${element.unitPrice}'),
          TableColumnExpense('${element.amount}'),
          TableColumnExpense('${element.getSubTotal()}'),
        ],
      ));
    }
    return result;
  }
}

class TableColumnExpense extends StatelessWidget {
  const TableColumnExpense(this.columnText,
      {super.key, this.color = Colors.white, this.style = kTableTextStyle});
  final String columnText;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        bottom: 10.0,
      ),
      child: Text(
        columnText,
        style: style,
      ),
    );
  }
}
