import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          ReusableCard(
            height: 130.0,
            colour: Colors.orangeAccent,
            cardChild: Text('Balance'),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  height: 90.0,
                  colour: Color(0xff918abe),
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Balance'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  height: 90.0,
                  colour: Color(0xffff5959),
                  cardChild: Text('Balance'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              height: 30.0,
              colour: Colors.white,
              cardChild: Text('Balance'),
            ),
          ),
        ],
      ),
    );
  }
}
