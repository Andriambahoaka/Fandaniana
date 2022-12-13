import 'package:fandaniana/screens/listExpenseScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/total_by_typeexpense.dart';
import '../utilities/constants.dart';
import 'daily_expense_list.dart';
import 'expense_list.dart';
import 'expense_table_row.dart';

class TotalByTypeExpenseTile extends StatelessWidget {
  TotalByTypeExpenseTile(this.totalByType);

  final TotalByTypeExpense totalByType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          "images/${totalByType.typeExpense.image}.png",
          height: 45,
        ),
        title: Text(
          totalByType.typeExpense.type,
          style: kLabelTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        trailing: Text(
          '- Ar ${totalByType.totalPrice}',
          style: kLabelTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: ExpenseList(totalByType.idDailyExpense,
                        totalByType.typeExpense.idTypeExpense),
                  ));
        });
  }
}
