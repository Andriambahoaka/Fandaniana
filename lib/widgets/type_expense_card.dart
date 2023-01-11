import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dao/expense_dao.dart';
import '../models/type_expense.dart';
import '../utilities/utility.dart';
import 'my_tooltip.dart';

class TypeExpenseCard extends StatelessWidget {
  final TypeExpense typeExpense;
  final Function()? onTap;

  const TypeExpenseCard(this.typeExpense, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: typeExpense.type,
      child: GestureDetector(
        // behavior: HitTestBehavior.opaque,
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        //onTapCancel: () => change(),
        child: Card(
          color: typeExpense.isSelected ? Colors.green : Colors.white,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Image.asset(
            Utility.getLinkImage(typeExpense.image),
            width: 45.0,
            height: 45.0,
          ),
        ),
      ),
    );
  }

  /*void _onTap(GlobalKey key) {
  }*/

  /* void change() {
    _isSelected = !_isSelected;
  }*/
}
