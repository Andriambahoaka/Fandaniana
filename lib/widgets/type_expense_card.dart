import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/type_expense.dart';
import 'my_tooltip.dart';

class TypeExpenseCard extends StatelessWidget {
  TypeExpenseCard(this.typeExpense);

  TypeExpense typeExpense;

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
        message: typeExpense.type,
        child: Card(
          color: Colors.teal,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            'images/${typeExpense.image}.png',
            width: 45.0,
            height: 45.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ));
  }
}
