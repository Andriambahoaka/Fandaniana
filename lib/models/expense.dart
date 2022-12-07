import 'package:flutter/cupertino.dart';

class Expense {
  Expense(this.type, this.price, this.imageName);

  final String type;
  final String imageName;
  final double price;
}
