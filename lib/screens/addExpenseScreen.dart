import 'package:fandaniana/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

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
              SizedBox(
                width: 240.0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price : ',
                        style: kHeadTextStyle.copyWith(
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueGrey),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100.0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Amount : ',
                        style: kHeadTextStyle.copyWith(
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 6, color: Colors.blueGrey),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
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
