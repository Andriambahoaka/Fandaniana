import 'package:fandaniana/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
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
              children: [
                TypeExpenseCard('hamburger'),
                TypeExpenseCard('house'),
                TypeExpenseCard('shirt'),
                TypeExpenseCard('drinks'),
                TypeExpenseCard('hamburger'),
                TypeExpenseCard('house'),
                TypeExpenseCard('shirt'),
                TypeExpenseCard('drinks'),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
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
            onChanged: (value) {},
          ),
          Row(
            children: [
              SizedBox(
                width: 150.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                width: 150.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TypeExpenseCard extends StatelessWidget {
  TypeExpenseCard(this.imageName);

  String imageName;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.asset(
        'images/$imageName.png',
        width: 45.0,
        height: 45.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
