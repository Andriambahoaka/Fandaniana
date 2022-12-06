import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/reusable_card.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>['JANOARY', 'FEBROARY', 'MARTSA', 'APRILY'];
    String dropdownValue = list.first;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            Icons.add,
            size: 34,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.1, 1.0],
                  tileMode: TileMode.clamp,
                  colors: [Color(0xffc8708a), Colors.red])),
        ),
        onPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Image.asset(
                    "images/down.png",
                    width: 15,
                    height: 15,
                  ),
                  elevation: 56,
                  style: const TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'Bebas Neue',
                  ),
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
                          'Income',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Valera',
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          'Ar4200 ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Bebas Neue',
                            fontSize: 35.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 6,
                left: 230,
                child: Container(
                  child: Image.asset(
                    'images/wallet_.png',
                    width: 135,
                    height: 155,
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
                  colour: Color(0xffff5959),
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
              padding: EdgeInsets.only(left: 10, right: 5),
              height: 30.0,
              colour: Colors.white,
              cardChild: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
