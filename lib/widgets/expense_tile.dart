import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ExpenseTile extends StatelessWidget {
  ExpenseTile(this.type, this.image, this.price);

  final String type;
  final String image;
  final double price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "images/$image.png",
        height: 45,
      ),
      title: Text(
        type,
        style: kLabelTextStyle.copyWith(
          color: Colors.black,
        ),
      ),
      trailing: Text(
        '- Ar $price',
        style: kLabelTextStyle.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
