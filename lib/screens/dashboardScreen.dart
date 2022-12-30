import 'package:fandaniana/screens/addExpenseScreen.dart';
import 'package:fandaniana/widgets/daily_expense_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../utilities/utility.dart';
import '../widgets/reusable_card.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>['JANOARY', 'FEBROARY', 'MARTSA', 'APRILY'];
    String dropdownValue = list.first;
    return Scaffold(
      floatingActionButton: const AddingButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Image.asset(
                    Utility.getLinkImage('down'),
                    width: 15,
                    height: 15,
                  ),
                  elevation: 56,
                  style: KSummaryLabelStyle,
                  underline: SizedBox(),
                  onChanged: (String? value) {},
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: DropdownButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    size: 34,
                  ),
                  elevation: 56,
                  underline: SizedBox(),
                  onChanged: (String? value) {},
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              ReusableCard(
                padding: EdgeInsets.only(left: 20, right: 5),
                height: 130.0,
                colour: Colors.orangeAccent,
                cardChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance',
                          style: kLabelTextStyle.copyWith(fontSize: 30.0),
                        ),
                        Text(
                          'Ar4200 ',
                          style: kAmountTextStyle.copyWith(fontSize: 35.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 2,
                left: 230,
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    child: Image.asset(
                      'images/wallet_.png',
                      width: 135,
                      height: 155,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  height: 90.0,
                  colour: Color(0xff918abe),
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Income',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            'Ar 4200 ',
                            style: kAmountTextStyle,
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/income.png',
                        width: 60,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  height: 90.0,
                  colour: const Color(0xffff5959),
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Expense',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            '- Ar 4200 ',
                            style: kAmountTextStyle,
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/expense.png',
                        width: 50,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              padding: EdgeInsets.all(0),
              height: 30.0,
              colour: Colors.white,
              cardChild: DailyExpenseList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AddingButton extends StatelessWidget {
  const AddingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        width: 60,
        height: 60,
        child: Icon(
          Icons.add,
          size: 34,
        ),
        decoration: kFloatingButtonDecoration,
      ),
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddExpenseScreen(),
                ));
      },
    );
  }
}
