import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/type_expense.dart';
import '../utilities/utility.dart';
import 'my_tooltip.dart';

class TypeExpenseCard extends StatelessWidget {
  Function()? onTap;

  TypeExpenseCard(this.typeExpense, {this.onTap});

  TypeExpense typeExpense;

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: typeExpense.type,
      child: GestureDetector(
        // behavior: HitTestBehavior.opaque,
        onTap: () => onTap,
        //onTapCancel: () => change(),
        child: Card(
          color: _isSelected ? Colors.green : Colors.white,
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
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
    // change();
  }

  void change() {
    _isSelected = !_isSelected;
  }
}
