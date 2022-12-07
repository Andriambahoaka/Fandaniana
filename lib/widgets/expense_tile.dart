import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../utilities/constants.dart';

class ExpenseTile extends StatelessWidget {
  ExpenseTile(this.depense);

  final Expense depense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.asset(
          "images/${depense.imageName}.png",
          height: 45,
        ),
        title: Text(
          depense.type,
          style: kLabelTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        trailing: Text(
          '- Ar ${depense.price}',
          style: kLabelTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        onTap: () {
          showModalBottomSheet(
              context: context, builder: (context) => Container());
        });
  }
}
