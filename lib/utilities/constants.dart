import 'package:flutter/material.dart';

const kSummaryLabelStyle = TextStyle(
  fontSize: 35.0,
  color: Colors.black,
// fontWeight: FontWeight.bold,
  fontFamily: 'Bebas Neue',
);

const kAmountTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Bebas Neue',
  fontSize: 25.0,
);

const kLabelTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Valera',
  fontSize: 20.0,
);

const kHeadTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Valera',
  fontWeight: FontWeight.bold,
  fontSize: 19.0,
);

const kTableTextStyle = TextStyle(
  color: Colors.black,
  //fontFamily: 'Valera',
  fontSize: 19.0,
);

TextStyle kTableTextStyleWeight =
    kTableTextStyle.copyWith(fontWeight: FontWeight.bold);

const kFloatingButtonDecoration = BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: [0.1, 1.0],
        tileMode: TileMode.clamp,
        colors: [Color(0xffc8708a), Colors.red]));

const kTableHeadColor = Color(0xffcfd8dc);
const kActiveCardColor = Colors.blueGrey;
const kInactiveCardColor = Colors.white;
