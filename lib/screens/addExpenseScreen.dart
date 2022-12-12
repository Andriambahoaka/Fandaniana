import 'package:fandaniana/dao/expense_dao.dart';
import 'package:fandaniana/utilities/constants.dart';
import 'package:fandaniana/widgets/type_expense_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/type_expense_card.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  List<TypeExpenseCard> _buildRowList() {
    return ExpenseDao.typeExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Type : ',
              style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildRowList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Designation : ',
              style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueGrey),
              ),
            ),
            autofocus: true,
            onChanged: (value) {},
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NumberTextField(240.0, 'Price'),
              NumberTextField(100.0, 'Amount')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text(
              'Add',
              style: kHeadTextStyle.copyWith(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal, // Text Color
              minimumSize: const Size.fromHeight(50),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class NumberTextField extends StatelessWidget {
  NumberTextField(this.width, this.label);

  final double width;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$label : ',
              style: kHeadTextStyle.copyWith(fontWeight: FontWeight.w100),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blueGrey),
              ),
            ),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
