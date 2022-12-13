import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/total_by_typeexpense.dart';
import '../utilities/constants.dart';
import 'daily_expense_list.dart';

class ExpenseTile extends StatelessWidget {
  ExpenseTile(this.depense);

  final TotalByTypeExpense depense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          "images/${depense.typeExpense.image}.png",
          height: 45,
        ),
        title: Text(
          depense.typeExpense.type,
          style: kLabelTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        trailing: Text(
          '- Ar ${depense.totalPrice}',
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
              builder: (context) => Container(child: DailyExpenseList()));
        });
  }
}
