import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/reusable_card.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  colors: [Colors.blue, Colors.red])),
        ),
        onPressed: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                  colour: Colors.blueGrey,
                  cardChild: Text('Balance'),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  height: 90.0,
                  colour: Colors.blueGrey,
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
