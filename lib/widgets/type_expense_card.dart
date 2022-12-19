import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/type_expense.dart';
import '../utilities/utility.dart';
import 'my_tooltip.dart';

class TypeExpenseCard extends StatelessWidget {
  TypeExpenseCard(this.typeExpense);

  TypeExpense typeExpense;

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      message: typeExpense.type,
      child: Card(
        color: Colors.white,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Image.asset(
          Utility.getLinkImage(typeExpense.image),
          width: 45.0,
          height: 45.0,
        ),
      ),
    );
  }
}
